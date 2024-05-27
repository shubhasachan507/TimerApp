import "package:flutter/material.dart";

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
              ?.copyWith(color: AppColors.primaryTealColor),
        ),
        const SizedBox(
          width: 8,
        ),
        currentTask.isRunning
            ? GestureDetector(
                onTap: () {
                  taskStore.pauseTimer(currentTask);
                },
                child: Image.asset(Images.pauseIcon))
            : GestureDetector(
                onTap: () {
                  taskStore.playTimer(currentTask);
                },
                child: Image.asset(Images.playIcon),
              ),
        const SizedBox(
          width: 8,
        ),
        GestureDetector(
            onTap: () {
              taskStore.removeTask(currentTask);
            },
            child: Image.asset(Images.stopIcon)),
      ],
    );
  }
}
