import 'package:flutter/material.dart';

class CurvePainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.green[800];
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2.0;
    
    var path = Path();

    path.lineTo(size.width, size.height);

    canvas.drawPath(path, paint);
  }

  @override 
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
