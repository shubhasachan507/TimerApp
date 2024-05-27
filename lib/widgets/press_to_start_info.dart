import "package:flutter/material.dart";
import "package:potatotimer/index.dart";

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
          AppStrings.fabInfo,
          style: Theme.of(context).textTheme.bodyMedium,
          overflow: TextOverflow.ellipsis,
        ),
        Image.asset(Images.arrowIcon),
      ],
    );
  }
}
