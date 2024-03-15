import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class TrapeziumContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Container(
          width: 80.w,
          height: 60.h,
          child: CustomPaint(
            painter: TrapeziumPainter(),
          ),
        ),
      ),
    );
  }
}

class TrapeziumPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white;

    final path = Path()
      ..moveTo(0, size.height * 0.3) // Top left point
      ..lineTo(size.width, 0) // Top right point
      ..lineTo(size.width, size.height) // Bottom right point
      ..lineTo(0, size.height) // Bottom left point
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
