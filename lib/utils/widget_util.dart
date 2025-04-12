part of 'index.dart';

class WidgetUtil {
  bool _hasMeasured = false;
  double? _width;
  double? _height;

  /// Widget rendering listener.
  /// Widget渲染监听.
  /// context: Widget context.
  /// isOnce: true,Continuous monitoring  false,Listen only once.
  /// onCallBack: Widget Rect CallBack.
  void asyncPrepare(
      BuildContext context, bool isOnce, ValueChanged<Rect> onCallBack) {
    if (_hasMeasured) return;
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
      RenderObject? box = context.findRenderObject();
      if (box != null && box.semanticBounds != null) {
        if (isOnce) _hasMeasured = true;
        double width = box.semanticBounds.width;
        double height = box.semanticBounds.height;
        if (_width != width || _height != height) {
          _width = width;
          _height = height;
          if (onCallBack != null) onCallBack(box.semanticBounds);
        }
      }
    });
  }

  // /// Widget渲染监听.
  // void asyncPrepares(bool isOnce, ValueChanged<Rect> onCallBack) {
  //   if (_hasMeasured) return;
  //   WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
  //     if (isOnce) _hasMeasured = true;
  //     onCallBack();
  //   });
  // }

  ///get Widget Bounds (width, height, left, top, right, bottom and so on).Widgets must be rendered completely.
  ///获取widget Rect
  static Rect getWidgetBounds(BuildContext context) {
    RenderObject? box = context.findRenderObject();
    return (box != null) ? box.semanticBounds : Rect.zero;
  }

  ///Get the coordinates of the widget on the screen.Widgets must be rendered completely.
  ///获取widget在屏幕上的坐标,widget必须渲染完成
  static Offset getWidgetLocalToGlobal(BuildContext context) {
    RenderBox? box = context.findRenderObject() as RenderBox;
    return box == null ? Offset.zero : box.localToGlobal(Offset.zero);
  }

  /// get image width height，load error return Rect.zero.（unit px）
  /// 获取图片宽高，加载错误情况返回 Rect.zero.（单位 px）
  /// image
  /// url network
  /// local url , package
  static Future<Rect> getImageWH(
      {Image? image, String? url, String? localUrl, String? package}) {
    if (ObjectUtils.isEmpty(image) &&
        ObjectUtils.isEmpty(url) &&
        ObjectUtils.isEmpty(localUrl)) {
      return Future.value(Rect.zero);
    }
    final Completer<Rect> completer = Completer<Rect>();
    var img = image ??
        ((url != null && url.isNotEmpty)
            ? Image.network(url)
            : Image.asset(localUrl ?? '', package: package));
    img.image
        .resolve(const ImageConfiguration())
        .addListener(ImageStreamListener(
          (ImageInfo info, bool _) {
            completer.complete(Rect.fromLTWH(0, 0, info.image.width.toDouble(),
                info.image.height.toDouble()));
          },
          onError: (Object exception, StackTrace? stackTrace) {
            completer.completeError(exception, stackTrace);
          },
        ));
    return completer.future;
  }

  /// get image width height, load error throw exception.（unit px）
  /// 获取图片宽高，加载错误会抛出异常.（单位 px）
  /// image
  /// url network
  /// local url (full path/全路径，example："assets/images/ali_connors.png"，""assets/images/3.0x/ali_connors.png"" );
  /// package
  static Future<Rect> getImageWHE(
      {Image? image, String? url, String? localUrl, String? package}) {
    if (ObjectUtils.isEmpty(image) &&
        ObjectUtils.isEmpty(url) &&
        ObjectUtils.isEmpty(localUrl)) {
      return Future.error("image is null.");
    }
    final Completer<Rect> completer = Completer<Rect>();
    Image img = image ??
        ((url != null && url.isNotEmpty)
            ? Image.network(url)
            : Image.asset(localUrl ?? '', package: package));
    img.image
        .resolve(const ImageConfiguration())
        .addListener(ImageStreamListener(
          (ImageInfo info, bool _) {
            completer.complete(Rect.fromLTWH(0, 0, info.image.width.toDouble(),
                info.image.height.toDouble()));
          },
          onError: (Object exception, StackTrace? stackTrace) {
            completer.completeError(exception, stackTrace);
          },
        ));

    return completer.future;
  }
}
