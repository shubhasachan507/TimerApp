import "package:flutter/material.dart";
import 'package:flutter_mobx/flutter_mobx.dart';
import '../index.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({
    super.key,
    required this.task,
    required this.index,
  });

  final Task task;
  final int index;

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  final taskStore = getIt<PotatoTimerStore>();

  @override
  void initState() {
    taskStore.startTimer(widget.task);
    super.initState();
  }

  @override
  void dispose() {
    taskStore.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
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
                  child: widget.task.remainingTime == 0
                      ? const TaskFinishedHeader()
                      : PlayPauseStopTimer(currentTask: widget.task)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  maxLines: 2,
                  widget.task.title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: const Color(0xff216C2E),
                        overflow: TextOverflow.ellipsis,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  maxLines: 2,
                  widget.task.description,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: const Color(0xff006782),
                        overflow: TextOverflow.ellipsis,
                      ),
                ),
              ),
              const Spacer(),
              if (widget.task.remainingTime == 0)
                GestureDetector(
                  onTap: () {
                    taskStore.removeTask(widget.task);
                    taskStore.stopSound();
                  },
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
    });
  }
}
