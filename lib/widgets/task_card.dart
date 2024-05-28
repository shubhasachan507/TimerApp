import "package:flutter/material.dart";
import '../index.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({
    super.key,
    required this.task,
    required this.index,
  });

  final TaskData task;
  final int index;

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  final taskStore = getIt<PotatoTimerStore>();

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(16),
        height: 196,
        width: double.maxFinite,
        decoration: ShapeDecoration(
          shadows: const [
            BoxShadow(
              color: AppColors.shadowColor,
              offset: Offset(0, 4),
              blurRadius: 4,
            ),
          ],
          color: AppColors.dialogBackgroundColor,
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
                child: widget.task.remainingTime == 0
                    ? const TaskFinishedHeader()
                    : PlayPauseStopTimer(currentTask: widget.task)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                maxLines: 1,
                widget.task.title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppColors.primaryGreenColor,
                      overflow: TextOverflow.ellipsis,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                maxLines: widget.task.remainingTime == 0 ? 2 : 3,
                widget.task.description,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.primaryTealColor,
                      overflow: TextOverflow.ellipsis,
                    ),
              ),
            ),
            const Spacer(),
            if (widget.task.remainingTime == 0)
              MarkComplete(
                task: widget.task,
              ),
          ],
        ));
  }
}
