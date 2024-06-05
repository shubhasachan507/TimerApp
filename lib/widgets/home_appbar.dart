import "package:flutter/material.dart";
import "../index.dart";

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(10),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, bottom: 8),
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(color: AppColors.primaryTealColor),
              ),
            ),
          )),
      //  backgroundColor: AppColors.primaryGreenColor,
      backgroundColor: AppColors.dialogBackgroundColor,
    );
  }
}
