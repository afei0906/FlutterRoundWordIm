part of '../index.dart';

class HttpService extends GetxService {
  static HttpService get to => Get.find();

  late final Dio _dio;

  final Duration _connectTimeout = const Duration(seconds: 30);
  final Duration _receiveTimeout = const Duration(seconds: 30);
  final Duration _sendTimeout = const Duration(minutes: 30);

  final cookieJar = CookieJar(); // 独立管理 Cookies

  @override
  void onInit() {
    super.onInit();

    final options = BaseOptions(
      baseUrl: Env.host,
      connectTimeout: _connectTimeout,
      receiveTimeout: _receiveTimeout,
      sendTimeout: _sendTimeout,
      headers: {},
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
    );

    _dio = Dio(options);

    _dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final client = HttpClient();
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        if (!Env.isProxy) {
          return client;
        }
        client.findProxy = (uri) {
          if (!Env.isProxy) {
            return "DIRECT";
          }
          return "PROXY ${Env.httpProxyHost}:${Env.httpProxyPort}";
        };
        return client;
      },
    );
    _dio.interceptors.add(_RequestInterceptor(cookieJar));
    // _dio.interceptors.add(_TokenQueuedInterceptor(_dio));
  }

  void setOption() {
    final options = BaseOptions(
      baseUrl: Env.host,
      connectTimeout: _connectTimeout,
      receiveTimeout: _receiveTimeout,
      sendTimeout: _sendTimeout,
      headers: {},
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
    );
    _dio.options = options;
  }

  Map<String, dynamic>? _getHeaders({bool excludeToken = false}) {
    final headers = <String, dynamic>{};
    // final token = StorageService.to.getString(kLocalToken);
    // if (token.isNotEmpty && !excludeToken) {
    //   headers['Authorization'] = 'Bearer $token';
    // }
    final bool isControllerRegistered =
        GetInstance().isRegistered<LanguageStore>();
    if (isControllerRegistered) {
      headers['lang'] = LanguageStore.to.locale.toString();
    } else {
      headers['lang'] = Get.locale.toString();
    }
    headers['DeviceID'] = ConfigStore.to.deviceID;
    headers['AppVersion'] = ConfigStore.to.appVersion;
    return headers;
  }

  Future<ResponseModel> get(
    String url, {
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
    bool excludeToken = false,
    bool showLoading = false,
    bool isShowMsg = false,
  }) async {
    if (showLoading) SmartDialog.showLoading(msg: LocaleKeys.text_0082.tr);
    try {
      final requestOptions = options ?? Options();
      requestOptions.headers = _getHeaders(excludeToken: excludeToken);
      final response = await _dio.get(
        url,
        queryParameters: params,
        options: requestOptions,
        cancelToken: cancelToken,
      );
      if (showLoading) SmartDialog.dismiss();
      showMsg(url, params, jsonEncode(response.data), isShowMsg);
      return ResponseModel.fromJson(response.data);
    } catch (error) {
      if (error is! DioException) SmartDialog.dismiss();
      showMsg(url, params, error, isShowMsg);
      rethrow;
    }
  }

  Future<ResponseModel> post(
    String url, {
    Object? params,
    Options? options,
    CancelToken? cancelToken,
    bool excludeToken = false,
    bool showLoading = false,
    bool isShowMsg = false,
  }) async {
    if (showLoading) SmartDialog.showLoading(msg: LocaleKeys.text_0082.tr);
    try {
      final requestOptions = options ?? Options();
      requestOptions.headers = _getHeaders(excludeToken: excludeToken);
      final response = await _dio.post(
        url,
        data: params,
        options: requestOptions,
        cancelToken: cancelToken,
      );
      if (showLoading) SmartDialog.dismiss();
      showMsg(url, params, jsonEncode(response.data), isShowMsg);
      return ResponseModel.fromJson(response.data);
    } catch (error) {
      // log("ffffffff>>>${(error as DioException).response?.statusCode}");
      if (error is! DioException) SmartDialog.dismiss();
      showMsg(url, params, error, isShowMsg);
      return ResponseModel(
        code: -1,
        msg: "Server error",
      );
    }
  }

  Future<ResponseModel> delete(
    String url, {
    Object? params,
    Options? options,
    CancelToken? cancelToken,
    bool excludeToken = false,
    bool showLoading = false,
    bool isShowMsg = false,
  }) async {
    if (showLoading) SmartDialog.showLoading(msg: LocaleKeys.text_0082.tr);
    try {
      final requestOptions = options ?? Options();
      requestOptions.headers = _getHeaders(excludeToken: excludeToken);
      final response = await _dio.delete(
        url,
        data: params,
        options: requestOptions,
        cancelToken: cancelToken,
      );
      if (showLoading) SmartDialog.dismiss();
      showMsg(url, params, jsonEncode(response.data), isShowMsg);
      return ResponseModel.fromJson(response.data);
    } catch (error) {
      if (error is! DioException) SmartDialog.dismiss();
      showMsg(url, params, error, isShowMsg);
      rethrow;
    }
  }

  Future<ResponseModel> put(
    String url, {
    Object? params,
    Options? options,
    CancelToken? cancelToken,
    bool excludeToken = false,
    bool showLoading = false,
    bool isShowMsg = false,
  }) async {
    if (showLoading) SmartDialog.showLoading(msg: LocaleKeys.text_0082.tr);
    try {
      final requestOptions = options ?? Options();
      requestOptions.headers = _getHeaders(excludeToken: excludeToken);
      final response = await _dio.put(
        url,
        data: params,
        options: requestOptions,
        cancelToken: cancelToken,
      );
      if (showLoading) SmartDialog.dismiss();
      showMsg(url, params, jsonEncode(response.data), isShowMsg);
      return ResponseModel.fromJson(response.data);
    } catch (error) {
      if (error is! DioException) SmartDialog.dismiss();
      showMsg(url, params, error, isShowMsg);
      rethrow;
    }
  }

  Future<ResponseModel> patch(
    String url, {
    Object? params,
    Options? options,
    CancelToken? cancelToken,
    bool excludeToken = false,
    bool showLoading = false,
    bool isShowMsg = false,
  }) async {
    if (showLoading) SmartDialog.showLoading(msg: LocaleKeys.text_0082.tr);
    try {
      final requestOptions = options ?? Options();
      requestOptions.headers = _getHeaders(excludeToken: excludeToken);
      final response = await _dio.patch(
        url,
        data: params,
        options: requestOptions,
        cancelToken: cancelToken,
      );
      if (showLoading) SmartDialog.dismiss();
      showMsg(url, params, jsonEncode(response.data), isShowMsg);
      return ResponseModel.fromJson(response.data);
    } catch (error) {
      if (error is! DioException) SmartDialog.dismiss();
      showMsg(url, params, error, isShowMsg);
      rethrow;
    }
  }

  Future<ResponseModel> upload(
    String url, {
    required String path,
    Options? options,
    CancelToken? cancelToken,
    bool excludeToken = false,
    ProgressCallback? onSendProgress,
    bool showLoading = false,
    bool isShowMsg = false,
  }) async {
    if (showLoading) SmartDialog.showLoading(msg: LocaleKeys.text_0082.tr);
    final requestOptions = options ?? Options();
    requestOptions.headers = _getHeaders(excludeToken: excludeToken);
    var name = path.substring(path.lastIndexOf("/") + 1, path.length);
    String suffix = name.substring(name.lastIndexOf(".") + 1, name.length);
    var contentType = MediaType("image", suffix);
    var attfile = await MultipartFile.fromFile(path,
        filename: name, contentType: contentType);
    FormData formData = FormData.fromMap({
      "file": attfile,
    });
    try {
      final response = await _dio.post(
        url,
        data: formData,
        options: requestOptions,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
      );
      SmartDialog.dismiss();

      return ResponseModel.fromJson(response.data);
    } catch (error) {
      if (error is! DioException) SmartDialog.dismiss();
      showMsg(url, "{}", error, isShowMsg);
      rethrow;
    }
  }
}

class _TokenQueuedInterceptor extends QueuedInterceptor {
  final Dio dio;

  _TokenQueuedInterceptor(this.dio);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final response = err.response;
    final statusCode = response?.statusCode;
    if (statusCode == 401) {
      // final options = response!.requestOptions;
      // final result = await AccountAPI.refreshToken();
      // if (result != null) {
      //   if (result.isNotEmpty) token = result;
      //   await UserStore.to.setToken(token);
      //   options.headers['Authorization'] = 'Bearer $token';
      //   final origin = await dio.fetch(options);
      //   return handler.resolve(origin);
      // }
    }
    super.onError(err, handler);
  }
}

class _RequestInterceptor extends InterceptorsWrapper {
  CookieJar cookieJar;

  _RequestInterceptor(this.cookieJar);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // Cookies
    final cookies = await cookieJar.loadForRequest(options.uri);
    options.headers['cookie'] = cookies.join(';');
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (response.data == null) {
      handler.reject(
        DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        ),
        true,
      );
    } else {
      await cookieJar.saveFromResponse(
        response.requestOptions.uri,
        response.headers['set-cookie']
                ?.map((str) => Cookie.fromSetCookieValue(str))
                .toList() ??
            [],
      );
      super.onResponse(response, handler);
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    SmartDialog.dismiss();
    Console.log(
        "err.url = ${err.requestOptions.baseUrl}${err.requestOptions.path}\n"
        "err.method = ${err.requestOptions.method}\n"
        "err.requestData = ${err.requestOptions.data}\n"
        "err.message = ${err.response?.data}\n"
        "err.statusCode = ${err.response?.statusCode}\n"
        "err.type =${err.type}");
    // switch (err.type) {
    //   case DioExceptionType.connectionTimeout:
    //     // CustomToast.text('网络连接超时');
    //     break;
    //   case DioExceptionType.sendTimeout:
    //     // CustomToast.text('发送超时');
    //     break;
    //   case DioExceptionType.receiveTimeout:
    //     // CustomToast.text('接收超时');
    //     break;
    //   case DioExceptionType.badCertificate:
    //     // CustomToast.text('证书错误');
    //     break;
    //   case DioExceptionType.badResponse:
    //     final response = err.response;
    //     final statusCode = response?.statusCode;
    //     final code = int.tryParse(response?.data['code']?.toString() ?? '');
    //     var msg = '服务器错误';
    //     switch (statusCode) {
    //       case 401:
    //         msg = '$statusCode - Unauthorized';
    //       case 404:
    //         msg = '$statusCode - Server not found';
    //       case 500:
    //         msg = '$statusCode - Server error';
    //       case 502:
    //         msg = '$statusCode - Bad gateway';
    //       default:
    //         if (code == 500) UserStore.to.logout();
    //         msg = response?.data?['Result']?.toString() ?? msg;
    //         break;
    //     }
    //   // CustomToast.text(msg);
    //   case DioExceptionType.cancel:
    //     Console.log('请求取消');
    //   case DioExceptionType.connectionError:
    //   // CustomToast.text('网络连接失败');
    //   case DioExceptionType.unknown:
    //   // CustomToast.text('请求发生未知错误');
    // }
    super.onError(err, handler);
  }
}

void showMsg(String url, dynamic params, dynamic data, bool isShowMsg) {
  // if (isShowMsg) {
  log('url:${Env.host}$url\nparams:${jsonEncode(params)}\ndata:$data');
  // }
}
