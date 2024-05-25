import "package:flutter/material.dart";

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.title,
    this.maxLines = 1,
    required this.controller,
  });

  final String title;
  final int? maxLines;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        textAlign: TextAlign.start,
        maxLines: maxLines,
        autofocus: true,
        validator: (val) {
          if (val!.trim().isEmpty) return '$Title is required.';
          return null;
        },
        decoration: InputDecoration(
          floatingLabelStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Color(0xff006782),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: Color(0xff006782),
            ),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          label: Text(
            title,
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: Color(0xff70787D),
            ),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    );
  }
}
