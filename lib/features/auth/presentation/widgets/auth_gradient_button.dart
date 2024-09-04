import 'package:flutter/material.dart';
import 'package:plant_health_monitor/core/theme/app_pallet.dart';

class AuthGradientButton extends StatelessWidget {
  final String text;
  final VoidCallback ontap;

  const AuthGradientButton({super.key, required this.text,required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        gradient: LinearGradient(
          colors: [
            AppPallet.gradient2,
            AppPallet.blue,
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
      child: ElevatedButton(
        onPressed: ontap,
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(395, 57),
          backgroundColor: AppPallet.transparent,
          shadowColor: AppPallet.transparent,
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
