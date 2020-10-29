import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatAnglePainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.white
      ..strokeWidth = 1
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(10, 15);
    path.lineTo(10, 25);
    path.lineTo(5, 20);
    path.lineTo(10, 15);

    canvas.drawPath(path, paint);


  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}