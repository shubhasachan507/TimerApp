import "package:flutter/material.dart";
import "../index.dart";

class TaskFinishedHeader extends StatelessWidget {
  const TaskFinishedHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(Images.soundWaveIcon),
        Text(
          AppStrings.finished,
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: AppColors.primaryTealColor,
              ),
        ),
        Image.asset(Images.soundWaveIcon),
      ],
    );
  }
}
