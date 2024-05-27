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
  bool _showErrorBorder = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border:
            _showErrorBorder ? Border.all(color: Colors.red, width: 2) : null,
        borderRadius: BorderRadius.circular(2),
      ),
      height: 32,
      width: 38,
      child: TextFormField(
        validator: (val) {
          if (val!.trim().isEmpty) {
            setState(() {
              _showErrorBorder = true;
            });
            return null;
          }
          setState(() {
            _showErrorBorder = false;
          });
          return null;
        },
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
