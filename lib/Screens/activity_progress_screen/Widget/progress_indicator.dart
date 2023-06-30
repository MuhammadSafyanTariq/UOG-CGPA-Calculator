import 'dart:math';

import 'package:flutter/material.dart';

class ProgressPainter extends CustomPainter {
  final List<double> progressValues;
  final List<Color> subjectColors;

  ProgressPainter({
    required this.progressValues,
    required this.subjectColors,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double totalProgress = _getTotalProgress();
    double startAngle = -pi / 2; // Start angle at 12 o'clock position

    for (int i = 0; i < progressValues.length; i++) {
      double progress = progressValues[i];
      double sweepAngle = (progress / totalProgress) * 2 * pi;

      Paint progressPaint = Paint()
        ..color = subjectColors[i]
        ..style = PaintingStyle.stroke
        ..strokeWidth = 12;

      canvas.drawArc(
        Rect.fromCircle(
            center: size.center(Offset.zero), radius: size.width / 2),
        startAngle,
        sweepAngle,
        false,
        progressPaint,
      );

      startAngle += sweepAngle;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  double _getTotalProgress() {
    double totalProgress = 0;

    for (int i = 0; i < progressValues.length; i++) {
      totalProgress += progressValues[i];
    }

    return totalProgress;
  }
}
