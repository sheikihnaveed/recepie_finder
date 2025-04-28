import 'package:flutter/material.dart';

class AuthFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool obscureText;
  final Icon icon;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const AuthFormField({
    super.key,
    required this.controller,
    required this.label,
    this.obscureText = false,
    this.keyboardType,
    this.validator,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // prefixIcon: icon,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        prefixIcon: icon,
      ),
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,

    );
  }
}