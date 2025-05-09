part of '../index.dart';

class MinioUploadService {
  final String endpoint;
  final String accessKey;
  final String secretKey;
  final String bucketName;
  final String publicBucketName;
  final Dio dio;

  final Map<String, CancelToken> _uploadTasks = {};
  final Map<String, String> _fileMd5Cache = {};

  MinioUploadService({
    required this.endpoint,
    required this.accessKey,
    required this.secretKey,
    required this.bucketName,
    required this.publicBucketName,
  }) : dio = Dio(BaseOptions(
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
        ));

  // 开始上传文件
  Future<UploadTaskInfo> startUpload({
    required File file,
    required String folder,
    String? customFileName,
    bool isPublic = false,
    Function(String taskId, int received, int total)? onProgress,
  }) async {
    // 计算文件MD5
    final String fileMd5 = await Utils.computeFileMd5(file);
    final String taskId = fileMd5; //const Uuid().v4();
    final String bucket = isPublic ? publicBucketName : bucketName;
    final String fileName = customFileName ?? basename(file.path);
    final String objectKey = '$folder/$fileName';
    final String uploadUrl = '$endpoint/$bucket/$objectKey';

    // 创建取消令牌
    final CancelToken cancelToken = CancelToken();
    _uploadTasks[taskId] = cancelToken;

    // 获取文件大小
    final int fileSize = await file.length();

    _fileMd5Cache[taskId] = fileMd5;

    // 创建任务信息
    final UploadTaskInfo taskInfo = UploadTaskInfo(
      taskId: taskId,
      filePath: file.path,
      fileName: fileName,
      bucket: bucket,
      objectKey: objectKey,
      targetUrl: uploadUrl,
      totalSize: fileSize,
      uploadedSize: 0,
      status: UploadStatus.preparing,
      fileMd5: fileMd5,
    );

    // 检查断点续传数据
    final File? tempFile = await _getTempFile(taskId);
    if (tempFile != null && await tempFile.exists()) {
      try {
        final String content = await tempFile.readAsString();
        final Map<String, dynamic> data =
            jsonDecode(content) as Map<String, dynamic>;

        // 检查保存的MD5与当前文件MD5是否一致
        final String savedMd5 = Utils.toEmpty(data['fileMd5']) ?? '';
        if (savedMd5 == fileMd5) {
          taskInfo.uploadedSize =
              int.parse(Utils.toEmpty(data['uploadedSize']) ?? '0');

          if (taskInfo.uploadedSize > 0 &&
              taskInfo.uploadedSize < taskInfo.totalSize) {
            taskInfo.status = UploadStatus.paused;
            return taskInfo;
          }
        } else {
          // MD5不匹配，文件已更改，需要重新上传
          print('文件已更改，需要重新上传');
          await tempFile.delete();
        }
      } catch (e) {
        print('读取断点续传数据失败: $e');
      }
    }

    // 直接开始上传
    return _uploadWithProgress(taskInfo, file, onProgress);
  }

  // 暂停上传
  Future<bool> pauseUpload(String taskId) async {
    if (_uploadTasks.containsKey(taskId)) {
      _uploadTasks[taskId]?.cancel('用户暂停上传');
      _uploadTasks.remove(taskId);
      return true;
    }
    return false;
  }

  // 恢复上传
  Future<UploadTaskInfo> resumeUpload({
    required UploadTaskInfo taskInfo,
    Function(String taskId, int received, int total)? onProgress,
  }) async {
    final File file = File(taskInfo.filePath);
    if (!await file.exists()) {
      throw Exception('文件不存在');
    }

    // 重新计算MD5，确保文件没有更改
    final String currentMd5 = await Utils.computeFileMd5(file);
    if (currentMd5 != taskInfo.fileMd5) {
      // 文件已更改，需要重新上传
      taskInfo.uploadedSize = 0;
      taskInfo.fileMd5 = currentMd5;

      // 删除旧的断点续传信息
      final File? tempFile = await _getTempFile(taskInfo.taskId);
      if (tempFile != null && await tempFile.exists()) {
        await tempFile.delete();
      }
    }

    _fileMd5Cache[taskInfo.taskId] = currentMd5;
    taskInfo.status = UploadStatus.uploading;
    return _uploadWithProgress(taskInfo, file, onProgress);
  }

  // 取消上传并清除任务
  Future<bool> cancelUpload(String taskId) async {
    final result = await pauseUpload(taskId);
    if (result) {
      // 删除断点续传文件
      final File? tempFile = await _getTempFile(taskId);
      if (tempFile != null && await tempFile.exists()) {
        await tempFile.delete();
      }
      _fileMd5Cache.remove(taskId);
      return true;
    }
    return false;
  }

  // 使用进度回调上传文件
  Future<UploadTaskInfo> _uploadWithProgress(
    UploadTaskInfo taskInfo,
    File file,
    Function(String taskId, int received, int total)? onProgress,
  ) async {
    try {
      taskInfo.status = UploadStatus.uploading;

      // 创建取消令牌
      final CancelToken cancelToken = CancelToken();
      _uploadTasks[taskInfo.taskId] = cancelToken;

      // 获取MD5
      final String fileMd5 =
          _fileMd5Cache[taskInfo.taskId] ?? await Utils.computeFileMd5(file);

      // 准备请求头
      final contentType =
          lookupMimeType(taskInfo.fileName) ?? 'application/octet-stream';
      final headers = await _getSignedHeaders(
        httpMethod: 'PUT',
        bucket: taskInfo.bucket,
        objectKey: taskInfo.objectKey,
        contentType: contentType,
        md5Hash: fileMd5,
      );

      // 如果有已上传部分，添加 Range 头
      if (taskInfo.uploadedSize > 0) {
        headers['Range'] =
            'bytes=${taskInfo.uploadedSize}-${taskInfo.totalSize - 1}';
      }

      // 准备上传数据
      final int startByte = taskInfo.uploadedSize;
      final int endByte = taskInfo.totalSize - 1;

      // 读取文件片段
      final RandomAccessFile randomAccessFile =
          await file.open(mode: FileMode.read);
      await randomAccessFile.setPosition(startByte);
      final List<int> bytes =
          await randomAccessFile.read(endByte - startByte + 1);
      await randomAccessFile.close();

      // 上传文件
      await dio.put<dynamic>(
        taskInfo.targetUrl,
        data: Stream.fromIterable([bytes]),
        options: Options(
          headers: headers,
          contentType: contentType,
        ),
        cancelToken: cancelToken,
        onSendProgress: (int sent, int total) {
          final int uploadedBytes = startByte + sent;
          taskInfo.uploadedSize = uploadedBytes;

          // 保存断点续传数据
          _saveTempFile(taskInfo);

          // 回调进度
          if (onProgress != null) {
            onProgress(taskInfo.taskId, uploadedBytes, taskInfo.totalSize);
          }
        },
      );

      // 上传完成，验证MD5
      final Response<dynamic> headResponse = await dio.head(taskInfo.targetUrl);
      final String? eTag = headResponse.headers.value('ETag');

      if (eTag != null) {
        // 移除ETag中的引号
        final String cleanEtag = eTag.replaceAll('"', '');
        if (cleanEtag != fileMd5 && !cleanEtag.contains(fileMd5)) {
          taskInfo.status = UploadStatus.failed;
          taskInfo.errorMessage = 'MD5校验失败，服务器文件可能已损坏';
          return taskInfo;
        }
      }

      // 上传完成
      taskInfo.status = UploadStatus.completed;
      _uploadTasks.remove(taskInfo.taskId);
      _fileMd5Cache.remove(taskInfo.taskId);

      // 清理断点续传文件
      final File? tempFile = await _getTempFile(taskInfo.taskId);
      if (tempFile != null && await tempFile.exists()) {
        await tempFile.delete();
      }

      return taskInfo;
    } on DioException catch (e) {
      if (CancelToken.isCancel(e)) {
        // 用户取消上传
        taskInfo.status = UploadStatus.paused;
      } else {
        // 其他错误
        taskInfo.status = UploadStatus.failed;
        taskInfo.errorMessage = '上传失败: ${e.message}';
      }
      return taskInfo;
    } catch (e) {
      taskInfo.status = UploadStatus.failed;
      taskInfo.errorMessage = '上传失败: $e';
      return taskInfo;
    }
  }

  // 获取签名请求头，包含MD5验证
  Future<Map<String, String>> _getSignedHeaders({
    required String httpMethod,
    required String bucket,
    required String objectKey,
    required String contentType,
    String? md5Hash,
  }) async {
    final DateTime now = DateTime.now().toUtc();
    final String amzDate = _formatAmzDate(now);
    final String dateStamp = _formatDateStamp(now);

    final Map<String, String> headers = {
      'Host': Uri.parse(endpoint).host,
      'x-amz-date': amzDate,
      'x-amz-content-sha256': 'UNSIGNED-PAYLOAD',
      'Content-Type': contentType,
    };

    // 添加MD5校验头
    if (md5Hash != null) {
      // 将MD5哈希值转为Base64编码（S3 API要求）
      final List<int> md5Bytes = hex.decode(md5Hash);
      final String md5Base64 = base64.encode(md5Bytes);
      headers['Content-MD5'] = md5Base64;
    }

    // 计算签名
    final String canonicalRequest = _getCanonicalRequest(
      httpMethod,
      '/$bucket/$objectKey',
      '',
      headers,
      'UNSIGNED-PAYLOAD',
    );

    final String stringToSign = _getStringToSign(
      dateStamp,
      'us-east-1', // MinIO默认区域
      canonicalRequest,
    );

    final String signature = _calculateSignature(
      secretKey,
      dateStamp,
      'us-east-1',
      stringToSign,
    );

    // 构建授权头
    final String scope = '$dateStamp/us-east-1/s3/aws4_request';
    final List<String> signedHeadersList = headers.keys
        .map((key) => key.toLowerCase())
        .where((key) => key != 'authorization')
        .toList()
      ..sort();

    final String signedHeaders = signedHeadersList.join(';');

    final String authorization = 'AWS4-HMAC-SHA256 ' +
        'Credential=$accessKey/$scope, ' +
        'SignedHeaders=$signedHeaders, ' +
        'Signature=$signature';

    headers['Authorization'] = authorization;
    return headers;
  }

  // 获取规范请求
  String _getCanonicalRequest(
    String method,
    String path,
    String queryString,
    Map<String, String> headers,
    String hashedPayload,
  ) {
    List<String> canonicalHeaders = [];
    List<String> signedHeadersList = [];

    headers.forEach((key, value) {
      if (key.toLowerCase() != 'authorization') {
        canonicalHeaders.add('${key.toLowerCase()}:$value');
        signedHeadersList.add(key.toLowerCase());
      }
    });

    canonicalHeaders.sort();
    signedHeadersList.sort();

    String canonicalRequest = '$method\n'
        '$path\n'
        '$queryString\n'
        '${canonicalHeaders.join('\n')}\n'
        '\n'
        '${signedHeadersList.join(';')}\n'
        '$hashedPayload';

    return canonicalRequest;
  }

  // 获取待签名字符串
  String _getStringToSign(
      String dateStamp, String region, String canonicalRequest) {
    String hashedRequest =
        sha256.convert(utf8.encode(canonicalRequest)).toString();

    return 'AWS4-HMAC-SHA256\n'
        '${dateStamp}T000000Z\n'
        '$dateStamp/$region/s3/aws4_request\n'
        '$hashedRequest';
  }

  // 计算签名
  String _calculateSignature(
      String secretKey, String dateStamp, String region, String stringToSign) {
    List<int> kDate = Hmac(sha256, utf8.encode('AWS4$secretKey'))
        .convert(utf8.encode(dateStamp))
        .bytes;
    List<int> kRegion = Hmac(sha256, kDate).convert(utf8.encode(region)).bytes;
    List<int> kService = Hmac(sha256, kRegion).convert(utf8.encode('s3')).bytes;
    List<int> kSigning =
        Hmac(sha256, kService).convert(utf8.encode('aws4_request')).bytes;

    List<int> signature =
        Hmac(sha256, kSigning).convert(utf8.encode(stringToSign)).bytes;
    return signature
        .map((byte) => byte.toRadixString(16).padLeft(2, '0'))
        .join();
  }

  // 格式化 AWS 日期
  String _formatAmzDate(DateTime date) {
    return '${date.year}${date.month.toString().padLeft(2, '0')}${date.day.toString().padLeft(2, '0')}T'
        '${date.hour.toString().padLeft(2, '0')}${date.minute.toString().padLeft(2, '0')}${date.second.toString().padLeft(2, '0')}Z';
  }

  // 格式化日期戳
  String _formatDateStamp(DateTime date) {
    return '${date.year}${date.month.toString().padLeft(2, '0')}${date.day.toString().padLeft(2, '0')}';
  }

  // 获取临时文件
  Future<File?> _getTempFile(String taskId) async {
    try {
      final Directory tempDir = await getTemporaryDirectory();
      final String tempFilePath = '${tempDir.path}/upload_$taskId.json';
      return File(tempFilePath);
    } catch (e) {
      print('获取临时文件失败: $e');
      return null;
    }
  }

  // 保存断点续传信息
  Future<void> _saveTempFile(UploadTaskInfo taskInfo) async {
    try {
      final File? tempFile = await _getTempFile(taskInfo.taskId);
      if (tempFile != null) {
        final Map<String, dynamic> data = {
          'taskId': taskInfo.taskId,
          'filePath': taskInfo.filePath,
          'fileName': taskInfo.fileName,
          'bucket': taskInfo.bucket,
          'objectKey': taskInfo.objectKey,
          'targetUrl': taskInfo.targetUrl,
          'totalSize': taskInfo.totalSize,
          'uploadedSize': taskInfo.uploadedSize,
          'fileMd5': taskInfo.fileMd5,
        };
        await tempFile.writeAsString(jsonEncode(data));
      }
    } catch (e) {
      print('保存断点续传信息失败: $e');
    }
  }
}

// 解码十六进制字符串
class hex {
  static List<int> decode(String hex) {
    List<int> result = [];
    for (int i = 0; i < hex.length; i += 2) {
      String byteString = hex.substring(i, i + 2);
      result.add(int.parse(byteString, radix: 16));
    }
    return result;
  }
}

// 上传任务状态
enum UploadStatus {
  preparing,
  uploading,
  paused,
  completed,
  failed,
}

// 上传任务信息
class UploadTaskInfo {
  final String taskId;
  final String filePath;
  final String fileName;
  final String bucket;
  final String objectKey;
  final String targetUrl;
  final int totalSize;
  int uploadedSize;
  UploadStatus status;
  String fileMd5;
  String? errorMessage;

  UploadTaskInfo({
    required this.taskId,
    required this.filePath,
    required this.fileName,
    required this.bucket,
    required this.objectKey,
    required this.targetUrl,
    required this.totalSize,
    required this.uploadedSize,
    required this.status,
    required this.fileMd5,
    this.errorMessage,
  });

  // 获取上传进度百分比
  double get progress {
    if (totalSize <= 0) return 0;
    return uploadedSize / totalSize;
  }
}
