import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:potatotimer/utils/index.dart";

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
    return SizedBox(
      height: 32,
      width: 38,
      child: TextFormField(
        autofocus: widget.autoFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: widget.controller,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.only(bottom: 10),
          border: InputBorder.none,
          filled: true,
          fillColor: AppColors.secondaryGreenColor,
          counterText: "",
          hintText: "00",
        ),
        maxLength: 2,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
      ),
    );
  }
}
