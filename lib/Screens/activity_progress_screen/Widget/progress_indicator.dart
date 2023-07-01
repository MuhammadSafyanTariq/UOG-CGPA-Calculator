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
    double marginAngle =
        pi / 180; // Adjust the margin angle as desired (1 degree in radians)

    // Calculate the adjusted total progress by subtracting the margin angle from the total progress
    double adjustedTotalProgress =
        totalProgress - (marginAngle * (progressValues.length - 1));

    for (int i = 0; i < progressValues.length; i++) {
      double progress = progressValues[i];
      double sweepAngle = (progress / adjustedTotalProgress) * 2 * pi;

      Paint marginPaint = Paint()
        ..color =
            Colors.transparent // Set the color to transparent for the margin
        ..style = PaintingStyle.stroke
        ..strokeWidth = 10;

      Paint progressPaint = Paint()
        ..color = subjectColors[i]
        ..style = PaintingStyle.stroke
        ..strokeWidth = 10;

      // Draw the margin arc before the colored arc
      canvas.drawArc(
        Rect.fromCircle(
          center: size.center(Offset.zero),
          radius: size.width / 2,
        ),
        startAngle,
        marginAngle,
        false,
        marginPaint,
      );

      // Increment the start angle by the margin angle
      startAngle += marginAngle;

      // Draw the colored arc
      canvas.drawArc(
        Rect.fromCircle(
          center: size.center(Offset.zero),
          radius: size.width / 2,
        ),
        startAngle,
        sweepAngle,
        false,
        progressPaint,
      );

      // Increment the start angle by the sweep angle
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
