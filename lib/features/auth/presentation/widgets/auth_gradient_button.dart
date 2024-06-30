import 'package:flutter/material.dart';
import 'package:flutterbloc/core/theme/app_pallete.dart';

class AuthGradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const AuthGradientButton({super.key, required this.text, required this.onPressed});


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppPallete.gradient1, AppPallete.gradient2],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(7.0),
        ),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(double.maxFinite, 50.0),
          shadowColor: AppPallete.transparentColor,
          backgroundColor: AppPallete.transparentColor,
        ),
        child: Text(text),
      ),
    );
  }
}
