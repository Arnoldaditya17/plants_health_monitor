import 'package:flutter/material.dart';

import '../utils/utils.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Center(
        child: InkWell(
          onTap: () {
            Utils.flushBarMessage("no internet", context);
           // Utils.toastMessages("aditya");
          },
          child: const Text("Login"),
        ),
      ),
    );
  }
}
