import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final String hintText;
  final bool isObsecure;
  final TextEditingController controller;

  const AuthField({super.key, required this.hintText, this.isObsecure = false, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObsecure,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter $hintText";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hintText,
        
      ),
    );
  }
}