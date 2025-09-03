import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  final String labelText;
  final bool obscureText;
  final TextEditingController controller;
  final Widget? suffixIcon;
  const MyTextfield({
    super.key,
    required this.labelText,
    required this.obscureText,
    required this.controller,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
