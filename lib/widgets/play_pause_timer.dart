import "package:flutter/material.dart";

class PlayPauseStopTimer extends StatelessWidget {
  const PlayPauseStopTimer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          "01:00:00",
          style: Theme.of(context)
              .textTheme
              .headlineLarge
              ?.copyWith(color: const Color(0xff006782)),
        ),
        const SizedBox(
          width: 8,
        ),
        Image.asset("asset/images/pause.png"),
        const SizedBox(
          width: 8,
        ),
        Image.asset("asset/images/stop.png"),
      ],
    );
  }
}
