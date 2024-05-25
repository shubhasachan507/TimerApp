import 'package:flutter/material.dart';

class Task {
  final String title;
  final String description;
  final int hours, minutes, seconds;

  Task(
      {required this.title,
      required this.description,
      required this.hours,
      required this.minutes,
      required this.seconds});
}
