part of '../index.dart';

// 自定义 TrianglePainter 类来绘制三角形
class TrianglePainter extends CustomPainter {
  final Color color; // 三角形的颜色

  TrianglePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill; // 填充

    // 创建三角形的路径
    final Path path = Path();
    path.moveTo(size.width / 2, 0); // 顶点
    path.lineTo(0, size.height);     // 左下角
    path.lineTo(size.width, size.height); // 右下角
    path.close(); // 关闭路径，形成三角形

    // 在画布上绘制三角形
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false; // 不需要重绘
  }
}