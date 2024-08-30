import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:another_flushbar/flushbar.dart';

class Utils {
  static void toastMessages(String message) {
    Fluttertoast.showToast(msg: message);
  }

  static void flushBarMessage(String message, BuildContext context) {
    Flushbar(
      duration: const Duration(seconds: 2),
      borderRadius: BorderRadius.circular(8),
      flushbarPosition: FlushbarPosition.TOP,
      forwardAnimationCurve: Curves.bounceInOut,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      icon: const Icon(Icons.dangerous_outlined, color: Colors.redAccent),
      message: message,
    ).show(context);
  }
}
