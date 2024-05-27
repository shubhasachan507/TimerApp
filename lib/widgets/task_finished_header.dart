import "package:flutter/material.dart";

class TaskFinishedHeader extends StatelessWidget {
  const TaskFinishedHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset("assets/images/soundwave.png"),
        Text(
          "FINISHED",
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: const Color(0xff006782),
              ),
        ),
        Image.asset("assets/images/soundwave.png"),
      ],
    );
  }
}
