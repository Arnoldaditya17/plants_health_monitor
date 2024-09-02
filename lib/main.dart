import 'package:flutter/material.dart';
import 'package:plant_health_monitor/core/theme/theme.dart';
import 'core/routes/routes.dart';
import 'core/routes/routes_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'plants health monitor app',
      theme: AppTheme.darkThemeMode,
      initialRoute: RoutesName.signin,
      onGenerateRoute: Routes.generateRoutes,
    );
  }
}
