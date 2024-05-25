import "package:flutter/material.dart";

class TimeInputTextField extends StatefulWidget {
  const TimeInputTextField(
      {this.controller, required this.autoFocus, super.key});

  final TextEditingController? controller;
  final bool autoFocus;

  @override
  State<TimeInputTextField> createState() => _TimeInputTextFieldState();
}

class _TimeInputTextFieldState extends State<TimeInputTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: const Color(0xffA7F5A7),
      ),
      height: 32,
      width: 38,
      child: Center(
        child: TextField(
          autofocus: widget.autoFocus,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          controller: widget.controller,
          decoration: const InputDecoration(
            border: InputBorder.none,
            counterText: "",
            hintText: "00",
          ),
          maxLength: 2,
          onChanged: (value) {
            if (value.length == 2) {
              FocusScope.of(context).nextFocus();
            }
          },
        ),
      ),
    );
  }
}
