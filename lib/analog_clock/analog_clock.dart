import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'analog_clock_painter.dart';

class AnalogClock extends StatelessWidget {
  final double size;
  final Alignment alignment;
  final Stream<DateTime> stream;

  const AnalogClock({
    Key? key,
    this.size = 300,
    this.alignment = Alignment.center,
    required this.stream,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: SizedBox(
        width: size,
        height: size,
        child: StreamBuilder<DateTime>(
          stream: stream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final dateTime = snapshot.data!;
            return CustomPaint(
              painter: AnalogClockPainter(
                dateTime: dateTime,
              ),
            );
          },
        ),
      ),
    );
  }
}
