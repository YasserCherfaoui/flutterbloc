import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutterbloc/core/theme/app_pallete.dart';
import 'package:flutterbloc/features/auth/presentation/widgets/auth_field.dart';
import 'package:flutterbloc/features/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:go_router/go_router.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Sign In.",
                style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30.0,
              ),
              AuthField(
                hintText: "Email",
                controller: emailController,
              ),
              const SizedBox(
                height: 15.0,
              ),
              AuthField(
                hintText: "Password",
                isObsecure: true,
                controller: passwordController,
              ),
              const SizedBox(
                height: 20.0,
              ),
              const AuthGradientButton(
                text: "Sign In",
              ),
              const SizedBox(
                height: 20.0,
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "Don't have an account? ",
                    style: Theme.of(context).textTheme.titleMedium),
                TextSpan(
                  text: "Sign Up",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: AppPallete.gradient2, fontWeight: FontWeight.bold),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => context.go("/register"),
                )
              ]))
            ],
          ),
        ),
      ),
    );
  }
}
