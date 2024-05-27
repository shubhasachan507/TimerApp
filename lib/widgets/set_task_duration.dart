import "package:flutter/material.dart";
import '../index.dart';

class SetTaskDuration extends StatelessWidget {
  const SetTaskDuration({
    super.key,
    required this.hourController,
    required this.minuteController,
    required this.secondController,
  });

  final TextEditingController hourController;
  final TextEditingController minuteController;
  final TextEditingController secondController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.duration,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DurationTextFieldWithLabel(
              controller: hourController,
              title: AppStrings.hh,
            ),
            const SizedBox(width: 10),
            const SizedBox(height: 32, child: Text(":")),
            const SizedBox(width: 10),
            DurationTextFieldWithLabel(
              controller: minuteController,
              title: AppStrings.mm,
            ),
            const SizedBox(width: 10),
            const SizedBox(height: 32, child: Text(":")),
            const SizedBox(width: 10),
            DurationTextFieldWithLabel(
              controller: secondController,
              title: AppStrings.ss,
            ),
          ],
        ),
      ],
    );
  }
}

class DurationTextFieldWithLabel extends StatelessWidget {
  const DurationTextFieldWithLabel({
    super.key,
    required this.title,
    this.controller,
  });

  final String title;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TimeInputTextField(
          controller: controller,
          autoFocus: false,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ],
    );
  }
}
