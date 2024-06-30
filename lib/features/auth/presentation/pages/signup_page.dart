import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/core/theme/app_pallete.dart';
import 'package:flutterbloc/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutterbloc/features/auth/presentation/widgets/auth_field.dart';
import 'package:flutterbloc/features/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:go_router/go_router.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Sign Up.",
                style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30.0,
              ),
              AuthField(
                hintText: "Name",
                controller: nameController,
              ),
              const SizedBox(
                height: 15.0,
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
              AuthGradientButton(
                text: "Sign Up",
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    context.read<AuthBloc>().add(
                          AuthSignUp(
                            name: nameController.text.trim(),
                            email: emailController.text.trim(),
                            password: passwordController.text,
                          ),
                        );
                  }
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "Already have an account? ",
                    style: Theme.of(context).textTheme.titleMedium),
                TextSpan(
                    text: "Sign In",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppPallete.gradient2,
                        fontWeight: FontWeight.bold),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => context.go('/'))
              ]))
            ],
          ),
        ),
      ),
    );
  }
}
