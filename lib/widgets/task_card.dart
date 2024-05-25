import 'dart:async';

import "package:flutter/material.dart";
import '../index.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({
    super.key,
    required this.title,
    required this.description,
    required this.hour,
    required this.minute,
    required this.second,
  });

  final String title;
  final String description;
  final int hour;
  final int minute;
  final int second;

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  Timer? timer;
  int initialTimerDuration = 0;
  int remainingTime = 0;
  DateTime? initialTime;
  DateTime? currentTime;

  @override
  void initState() {
    initialTime = DateTime(0, 0, 0, widget.hour, widget.minute, widget.second);
    currentTime = initialTime;
    initialTimerDuration =
        widget.hour * 3600 + widget.minute * 60 + widget.second;
    remainingTime = initialTimerDuration;
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {
        if (remainingTime > 0) {
          remainingTime--;
          currentTime = currentTime!.subtract(const Duration(seconds: 1));
        } else {
          timer?.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String currentSecond = currentTime!.second > 10
        ? currentTime!.second.toString()
        : "0${currentTime!.second}";
    String currentHour = currentTime!.hour != 0
        ? currentTime!.hour.toString()
        : "0${currentTime!.hour}";
    String currentMinute = currentTime!.minute != 0
        ? currentTime!.minute.toString()
        : "0${currentTime!.minute}";
    String currentDisplayTime = "$currentHour:$currentMinute:$currentSecond";
    return Container(
        margin: const EdgeInsets.all(16),
        height: 196,
        width: double.maxFinite,
        decoration: ShapeDecoration(
          shadows: const [
            BoxShadow(
              color: Color(0x40000000),
              offset: Offset(0, 4),
              blurRadius: 4,
            ),
          ],
          color: const Color(0xffFBFCFE),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
                padding: const EdgeInsets.fromLTRB(25.0, 20, 25, 10),
                child: remainingTime == 0
                    ? const TaskFinishedHeader()
                    : PlayPauseStopTimer(time: currentDisplayTime)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                widget.title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: const Color(0xff216C2E),
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                widget.description,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: const Color(0xff006782),
                    ),
              ),
            ),
            const Spacer(),
            if (remainingTime == 0)
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xffE1DFFF),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  height: 40,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      "MARK COMPLETE",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                ),
              )
          ],
        ));
  }
}
