import 'package:flutter/material.dart';

class CustomTextFeild extends StatelessWidget {
  const CustomTextFeild({
    super.key,
    this.validator,
    this.onTap,
    this.controller,
    required this.text,
    required this.prefix,
    this.suffix,
    this.obscureText = false,
  });
  final String? Function(String?)? validator;
  final void Function()? onTap;
  final TextEditingController? controller;
  final String text;
  final Widget prefix;
  final Widget? suffix;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      validator: validator,
      onTap: onTap,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(style: BorderStyle.none),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(style: BorderStyle.none),
          borderRadius: BorderRadius.circular(15),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),

          borderSide: BorderSide(
            color: Colors.red,
            width: 2,
            style: BorderStyle.solid,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),

          borderSide: BorderSide(
            color: Colors.green,
            width: 2,
            style: BorderStyle.solid,
          ),
        ),
        hintText: text,
        prefixIcon: prefix,
        suffixIcon: suffix,
        suffixIconColor: Colors.blue,
        prefixIconColor: Colors.blue,
        hintStyle: TextStyle(
          color: const Color.fromARGB(255, 50, 49, 49),
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        fillColor: const Color.fromARGB(255, 240, 239, 239),
        filled: true,
      ),
    );
  }
}
