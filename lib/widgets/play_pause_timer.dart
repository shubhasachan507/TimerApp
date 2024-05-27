import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";

import "../index.dart";

class PlayPauseStopTimer extends StatelessWidget {
  const PlayPauseStopTimer({
    super.key,
    required this.currentTask,
  });

  final TaskData currentTask;
  @override
  Widget build(BuildContext context) {
    final taskStore = getIt<PotatoTimerStore>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          taskStore.currentDisplayTime(currentTask),
          style: Theme.of(context)
              .textTheme
              .headlineLarge
              ?.copyWith(color: const Color(0xff006782)),
        ),
        const SizedBox(
          width: 8,
        ),
        currentTask.isRunning
            ? GestureDetector(
                onTap: () {
                  taskStore.pauseTimer(currentTask);
                },
                child: Image.asset("assets/images/pause.png"))
            : GestureDetector(
                onTap: () {
                  taskStore.playTimer(currentTask);
                },
                child: Image.asset("assets/images/play.png")),
        const SizedBox(
          width: 8,
        ),
        GestureDetector(
            onTap: () {
              taskStore.removeTask(currentTask);
            },
            child: Image.asset("assets/images/stop.png")),
      ],
    );
  }
}
