part of 'index.dart';

class Throttle {
  Throttle(this.delay);

  final Duration delay;
  int _lastRun = 0;

  /// 返回 true 表示可以执行
  bool shouldCall() {
    final now = DateTime.now().millisecondsSinceEpoch;
    if (now - _lastRun >= delay.inMilliseconds) {
      _lastRun = now;
      return true;
    }
    return false;
  }

  /// 包装一个带节流限制的函数执行
  void run(VoidCallback callback) {
    if (shouldCall()) {
      callback();
    }
  }
}
