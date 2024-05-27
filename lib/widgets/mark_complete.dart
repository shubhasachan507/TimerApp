import "package:flutter/material.dart";

import "../index.dart";

class MarkComplete extends StatelessWidget {
  const MarkComplete({
    super.key,
    required this.task,
  });

  final TaskData task;

  @override
  Widget build(BuildContext context) {
    final taskStore = getIt<PotatoTimerStore>();
    return GestureDetector(
      onTap: () async {
        await taskStore.stopSound();
        await taskStore.removeTask(task);
      },
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.buttonColor,
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        height: 35,
        width: double.infinity,
        child: Center(
          child: Text(
            AppStrings.markComplete,
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
      ),
    );
  }
}
