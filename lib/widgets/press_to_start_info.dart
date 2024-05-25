import "package:flutter/material.dart";

class PressToStartInformation extends StatelessWidget {
  const PressToStartInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          "No timers active. \nPress here to start a new one",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Image.asset("asset/images/arrow.png"),
      ],
    );
  }
}
