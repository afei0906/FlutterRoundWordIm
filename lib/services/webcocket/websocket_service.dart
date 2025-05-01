part of '../index.dart';

class WebSocketService {
  static String WS_URL = Env.wws;
  static const Duration HEARTBEAT_INTERVAL = Duration(seconds: 30);
  static const Duration RECONNECT_DELAY = Duration(seconds: 3);

  WebSocket? _socket;
  Timer? _heartbeatTimer;
  bool _isConnected = false;
  final _messageController =
      StreamController<(ImCommand, Uint8List?)>.broadcast();

  Stream<(ImCommand, Uint8List?)> get messageStream =>
      _messageController.stream;

  Future<void> connect() async {
    if (_isConnected) return;

    try {
      var headers = {
        'token': UserStore.to.userInfo.value.token,
      };
      log(">>>>${UserStore.to.userInfo.value.token}");
      _socket = await WebSocket.connect(WS_URL, headers: headers);
      _isConnected = true;

      // 发送握手请求
      await sendHandshake();

      // 设置二进制消息格式
      // _socket!.binaryType = "arraybuffer";

      _setupHeartbeat();
      _listenToMessages();
    } catch (e) {
      log('WebSocket connection failed: $e');
      _handleConnectionError();
    }
  }

  Future<void> sendHandshake() async {
    // 这里可以添加握手相关的protobuf数据
    await sendBinaryMessage(ImCommand.wxHandshakeReq);
  }

  void _setupHeartbeat() {
    _heartbeatTimer?.cancel();
    _heartbeatTimer = Timer.periodic(HEARTBEAT_INTERVAL, (timer) {
      sendHeartbeat();
    });
  }

  Future<void> sendHeartbeat() async {
    try {
      await sendBinaryMessage(ImCommand.heartbeat);
    } catch (e) {
      log('Error sending heartbeat: $e');
      _handleConnectionError();
    }
  }

  void _listenToMessages() {
    _socket?.listen(
      (dynamic data) {
        if (data is! List<int>) return;

        try {
          final message =
              BinaryMessageHelper.parseMessage(Uint8List.fromList(data));
          _handleMessage(message.$1, message.$2);
        } catch (e) {
          log('Error parsing message: $e');
        }
      },
      onError: (error) {
        log('WebSocket error: $error');
        _handleConnectionError();
      },
      onDone: () {
        log('WebSocket connection closed');
        _handleConnectionError();
      },
    );
  }

  void _handleMessage(ImCommand command, Uint8List? content) {
    switch (command) {
      case ImCommand.wxHandshakeAck:
        log('WebSocket wxHandshakeAck');
      case ImCommand.heartbeatAck:
        log('WebSocket heartbeatAck');
      case ImCommand.recv:
        log('WebSocket recv');
        // 处理接收到的消息
        _messageController.add((command, content));

        // 发送接收确认
        sendBinaryMessage(ImCommand.recvAck);
      default:
        _messageController.add((command, content));
    }
  }

  Future<void> sendBinaryMessage(ImCommand command,
      [Uint8List? content]) async {
    if (!_isConnected) {
      throw Exception('WebSocket not connected');
    }

    try {
      final message = BinaryMessageHelper.buildMessage(command, content);
      _socket?.add(message);
    } catch (e) {
      log('WebSocket Error sending message: $e');
      rethrow;
    }
  }

  void _handleConnectionError() {
    _isConnected = false;
    _heartbeatTimer?.cancel();
    _socket?.close();

    // 重连
    Future.delayed(RECONNECT_DELAY, () {
      if (!_isConnected) {
        connect();
      }
    });
  }

  Future<void> disconnect() async {
    _isConnected = false;
    _heartbeatTimer?.cancel();
    await sendBinaryMessage(ImCommand.disconnect);
    await _socket?.close();
    _socket = null;
  }

  void dispose() {
    _messageController.close();
    disconnect();
  }
}
