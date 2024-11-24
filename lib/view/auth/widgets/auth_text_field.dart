import 'package:flutter/material.dart';
import 'package:tourism/assistant/util/colors.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.hint,
    this.obscureText = false,
    this.controller, required this.validator,
  });
  final String hint;

  final String? Function(String?) validator;
  final bool obscureText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      style: TextStyle(color: Colors.white),
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        
        focusColor: primaryColor,
        // fillColor: Colors.white.withOpacity(0.8),
        hintText: hint,
        hintStyle: TextStyle(color: Colors.white),
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),

        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: primaryColor),
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
