import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnalogClockPainter extends CustomPainter {
  final DateTime dateTime;

  AnalogClockPainter({
    required this.dateTime,
    final Listenable? repaint,
  }) : super(repaint: repaint);

  @override
  void paint(Canvas canvas, Size size) {
    print('paint: $dateTime');
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final center = Offset(centerX, centerY);
    final radius = min(centerX, centerY);

    // background
    final fillBrush = Paint()..color = Color(0xFF444974);

    // border
    final outlineBrush = Paint()
      ..color = Color(0xFFEAECFF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16;
    // center
    final centerFillBrush = Paint()..color = Color(0xFFEAECFF);

    final secHandBrush = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5;

    final minHandBrush = Paint()
      ..color = Color(0xFF77DDFF)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 8;

    final hourHandBrush = Paint()
      // ..shader = RadialGradient(colors: [
      //   Color(0xFFEA74AB),
      //   Color(0xFFC279FB),
      // ]).createShader(Rect.fromCircle(center: center, radius: radius))
      ..color = Color(0xFFC279FB)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 12;

    canvas.drawCircle(center, radius - 40, fillBrush);
    canvas.drawCircle(center, radius - 40, outlineBrush);

    // 90 degree phase shift
    final shift = -(pi / 2);

    final hourHandX = centerX +
        60 *
            cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180 +
                shift);
    final hourHandY = centerX +
        60 *
            sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180 +
                shift);
    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourHandBrush);

    final minHandX = centerX + 80 * cos(dateTime.minute * 6 * pi / 180 + shift);
    final minHandY = centerX + 80 * sin(dateTime.minute * 6 * pi / 180 + shift);
    canvas.drawLine(center, Offset(minHandX, minHandY), minHandBrush);

    final secHandX = centerX + 80 * cos(dateTime.second * 6 * pi / 180 + shift);
    final secHandY = centerX + 80 * sin(dateTime.second * 6 * pi / 180 + shift);
    canvas.drawLine(center, Offset(secHandX, secHandY), secHandBrush);

    canvas.drawCircle(center, 16, centerFillBrush);
  }

  @override
  bool shouldRepaint(covariant AnalogClockPainter oldDelegate) {
    return oldDelegate.dateTime != dateTime;
  }
}
