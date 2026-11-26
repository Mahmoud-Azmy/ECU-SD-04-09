import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hText,
    this.pIcon,
    this.sIcon,
    this.isPass = false,
    this.isEmail = false,
    this.controller,
  });
  final String? hText;
  final Widget? pIcon;
  final Widget? sIcon;
  final bool isPass;
  final bool isEmail;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "this field is required";
        } else if (isEmail && !value.contains("@")) {
          return "enter a valid email";
        }
        return null;
      },
      obscureText: isPass,
      decoration: InputDecoration(
        hintText: hText,
        prefixIcon: pIcon,
        suffixIcon: sIcon,
        fillColor: Colors.grey,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
