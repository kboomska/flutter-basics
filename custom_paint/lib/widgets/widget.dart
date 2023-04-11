import 'dart:math';

import 'package:flutter/material.dart';

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.red,
          ),
        ),
        child: const RadialPercentWidget(
          percent: 0.68,
          fillColor: Colors.blue,
          lineColor: Colors.red,
          freeColor: Colors.yellow,
          lineWidth: 7,
          linePadding: 5,
          child: Text(
            '68%',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class RadialPercentWidget extends StatelessWidget {
  final Widget child;

  final double percent;
  final Color fillColor;
  final Color lineColor;
  final Color freeColor;
  final double lineWidth;
  final double linePadding;

  const RadialPercentWidget({
    super.key,
    required this.child,
    required this.percent,
    required this.fillColor,
    required this.lineColor,
    required this.freeColor,
    required this.lineWidth,
    required this.linePadding,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        CustomPaint(
          painter: MyPainter(
            percent: percent,
            fillColor: fillColor,
            lineColor: lineColor,
            freeColor: freeColor,
            lineWidth: lineWidth,
            linePadding: linePadding,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(25),
          child: Center(child: child),
        ),
      ],
    );
  }
}

class MyPainter extends CustomPainter {
  // final double percent = 0.68;
  // final double strokeWidth = 7;
  // final double strokePadding = 5;

  final double percent;
  final Color fillColor;
  final Color lineColor;
  final Color freeColor;
  final double lineWidth;
  final double linePadding;

  MyPainter({
    required this.percent,
    required this.fillColor,
    required this.lineColor,
    required this.freeColor,
    required this.lineWidth,
    required this.linePadding,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final backgroudPaint = Paint();
    backgroudPaint.color = fillColor;
    backgroudPaint.style = PaintingStyle.fill;
    // canvas.drawCircle(
    //   Offset(
    //     size.width / 2,
    //     size.height / 2,
    //   ),
    //   size.width / 2,
    //   paint,
    // );
    canvas.drawOval(Offset.zero & size, backgroudPaint);

    final freePaint = Paint();
    freePaint.color = freeColor;
    freePaint.style = PaintingStyle.stroke;
    freePaint.strokeWidth = lineWidth;
    canvas.drawArc(
      Offset(linePadding + (lineWidth / 2), linePadding + (lineWidth / 2)) &
          Size(
            size.width - (lineWidth + 2 * linePadding),
            size.height - (lineWidth + 2 * linePadding),
          ),
      2 * pi * percent - (pi / 2),
      2 * pi * (1 - percent),
      false,
      freePaint,
    );

    final fillPaint = Paint();
    fillPaint.color = lineColor;
    fillPaint.style = PaintingStyle.stroke;
    fillPaint.strokeWidth = lineWidth;
    fillPaint.strokeCap = StrokeCap.round;
    canvas.drawArc(
      Offset(linePadding + (lineWidth / 2), linePadding + (lineWidth / 2)) &
          Size(
            size.width - (lineWidth + 2 * linePadding),
            size.height - (lineWidth + 2 * linePadding),
          ),
      -pi / 2,
      2 * pi * percent,
      false,
      fillPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

/*
class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final circle = Paint();
    final rect = Paint();
    final line = Paint();

    final double dx = size.width / 2;
    final double dy = size.height / 2;

    circle.color = Colors.green;
    circle.style = PaintingStyle.stroke;
    circle.strokeWidth = 3;

    rect.color = Colors.purple;
    // rect.style = PaintingStyle.fill;
    rect.style = PaintingStyle.stroke;
    rect.strokeWidth = 10;

    line.color = Colors.blue;
    line.strokeWidth = 5;

    canvas.drawCircle(Offset(dx, dy), dx, circle);
    // canvas.drawRect(Offset.zero & Size(30, 30), rect);
    canvas.drawRect(const Offset(5, 5) & const Size(30, 30), rect);
    canvas.drawLine(Offset.zero, Offset(dx, dy), line);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
*/