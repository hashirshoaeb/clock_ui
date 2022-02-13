import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HandTheme {
  final Color? color;
  const HandTheme({this.color});
}

class AnalogClockTheme {
  final Color? backgroundColor;
  final HandTheme? hourHandTheme;
  final HandTheme? minuteHandTheme;
  final HandTheme? secondHandTheme;
  const AnalogClockTheme({
    this.backgroundColor,
    this.hourHandTheme,
    this.minuteHandTheme,
    this.secondHandTheme,
  });
}
