import 'package:flutter/material.dart';
import 'package:plant_health_monitor/core/routes/routes_name.dart';
import 'package:plant_health_monitor/features/auth/presentation/pages/signin_page.dart';
import 'package:plant_health_monitor/features/auth/presentation/pages/signup_page.dart';
import '../../features/home/presentation/pages/home_screen.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(
          builder: (BuildContext context) => const HomeScreen(),
        );
      case RoutesName.signin:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SignInPage(),
        );
      case RoutesName.signup:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SignUpPage(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) {
            return const Scaffold(
              body: Center(
                child: Text('no such routes'),
              ),
            );
          },
        );
    }
  }
}
