import 'package:flutter/material.dart';

import '../../../../core/routes/routes_name.dart';
import '../../../../core/theme/app_pallet.dart';

import '../widgets/auth_field.dart';
import '../widgets/auth_gradient_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

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
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "sign up.",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              AuthField(
                hintText: "Name",
                textEditingController: nameController,
              ),
              const SizedBox(
                height: 15,
              ),
              AuthField(
                hintText: "Email",
                textEditingController: emailController,
              ),
              const SizedBox(
                height: 15,
              ),
              AuthField(
                hintText: "Password",
                textEditingController: passwordController,
                isObscureText: true,
              ),
              const SizedBox(
                height: 20,
              ),
              AuthGradientButton(
                text: "Sign up",
                ontap: () {

                },
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.signin);
                },
                child: Text.rich(
                  TextSpan(
                      text: "Already have an account? ",
                      style: Theme.of(context).textTheme.titleMedium,
                      children: [
                        TextSpan(
                          text: "Sign in",
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: AppPallet.pink,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
