part of '../index.dart';

class MinioLogic {
  late MinioUploadService minioService;

  final List<UploadTaskInfo> _tasks = [];
  Function? call;
  bool isPublic = true;

  MinioLogic(this.call);

  void init() {
    minioService = MinioUploadService(
      endpoint: Utils.toEmpty(
              ConfigStore.to.picUpConfig[ConfigStore.minio]?.endpoint) ??
          '',
      accessKey: Utils.toEmpty(
              ConfigStore.to.picUpConfig[ConfigStore.minio]?.accessKey) ??
          '',
      secretKey: Utils.toEmpty(
              ConfigStore.to.picUpConfig[ConfigStore.minio]?.secretKey) ??
          '',
      bucketName: Utils.toEmpty(
              ConfigStore.to.picUpConfig[ConfigStore.minio]?.bucketName) ??
          '',
      publicBucketName: Utils.toEmpty(ConfigStore
              .to.picUpConfig[ConfigStore.minio]?.publicBucketName) ??
          '',
    );
  }

  Future<void> uploadFile(File file) async {
    try {
      // 创建上传任务
      final UploadTaskInfo taskInfo = await minioService.startUpload(
        file: file,
        folder: isPublic ? 'public' : 'private',
        isPublic: isPublic,
        onProgress: (String taskId, int received, int total) {
          // 更新UI
          final index = _tasks.indexWhere((t) => t.taskId == taskId);
          if (index >= 0) {
            _tasks[index].uploadedSize = received;
          }
        },
      );

      // 移除临时状态
      _tasks.removeWhere((t) => t.taskId.startsWith('temp_'));
      // 添加实际任务
      _tasks.add(taskInfo);
    } catch (e) {
      // 移除临时状态
      _tasks.removeWhere((t) => t.taskId.startsWith('temp_'));
      log("'上传失败: $e");
    }
  }

  void pauseUpload(UploadTaskInfo task) async {
    final result = await minioService.pauseUpload(task.taskId);
    if (result) {
      task.status = UploadStatus.paused;
    }
  }

  void resumeUpload(UploadTaskInfo task) async {
    task.status = UploadStatus.preparing;
    task.errorMessage = '正在校验MD5...';

    try {
      final updatedTask = await minioService.resumeUpload(
        taskInfo: task,
        onProgress: (String taskId, received, total) {
          // 更新UI
          final index = _tasks.indexWhere((t) => t.taskId == taskId);
          if (index >= 0) {
            _tasks[index].uploadedSize = received;
          }
        },
      );

      final index = _tasks.indexWhere((t) => t.taskId == task.taskId);
      if (index >= 0) {
        _tasks[index] = updatedTask;
      }
    } catch (e) {
      task.status = UploadStatus.failed;
      task.errorMessage = '恢复上传失败: $e';
    }
  }

  void cancelUpload(UploadTaskInfo task) async {
    final result = await minioService.cancelUpload(task.taskId);
    if (result) {
      _tasks.removeWhere((t) => t.taskId == task.taskId);
    }
  }

  void buildUploadItem(UploadTaskInfo task) {
    final bool isCompleted = task.status == UploadStatus.completed;
    final bool isFailed = task.status == UploadStatus.failed;
    final bool isPaused = task.status == UploadStatus.paused;
    final bool isUploading = task.status == UploadStatus.uploading;
    final bool isPreparing = task.status == UploadStatus.preparing;
    String statusText = '';
    switch (task.status) {
      case UploadStatus.preparing:
        statusText = task.errorMessage ?? '准备中';
      case UploadStatus.uploading:
        statusText = '上传中 (${(task.progress * 100).toStringAsFixed(1)}%)';
      case UploadStatus.paused:
        statusText = '已暂停';
      case UploadStatus.completed:
        statusText = '上传完成 (MD5校验通过)';
      case UploadStatus.failed:
        statusText = '上传失败: ${task.errorMessage}';
    }
  }
}
