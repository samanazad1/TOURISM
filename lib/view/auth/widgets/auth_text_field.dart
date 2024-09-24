import 'package:flutter/material.dart';
import 'package:tourism/helper/util/colors.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key, required this.hint,  this.controller,
  });
 final String hint;
 final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller:controller ,
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
