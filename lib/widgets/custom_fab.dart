import "package:flutter/material.dart";

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key,
    this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: SizedBox(
        height: 78,
        width: 78,
        child: FloatingActionButton(
          backgroundColor: const Color(0xffB6EAFF),
          shape: const CircleBorder(),
          onPressed: onPressed,
          child: Image.asset("asset/images/iAdd-Line.png"),
        ),
      ),
    );
  }
}
