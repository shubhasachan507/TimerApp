import "package:flutter/material.dart";
import '../index.dart';

class SetTaskDuration extends StatelessWidget {
  const SetTaskDuration({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Duration",
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DurationTextFieldWithLabel(
              title: "HH",
            ),
            SizedBox(width: 10),
            SizedBox(height: 32, child: Text(":")),
            SizedBox(width: 10),
            DurationTextFieldWithLabel(
              title: "MM",
            ),
            SizedBox(width: 10),
            SizedBox(height: 32, child: Text(":")),
            SizedBox(width: 10),
            DurationTextFieldWithLabel(
              title: "SS",
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
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TimeInputTextField(
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
