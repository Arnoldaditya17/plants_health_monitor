import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:plant_health_monitor/core/theme/theme.dart';
import 'package:plant_health_monitor/services/firebase_api.dart';
import 'core/routes/routes.dart';
import 'core/routes/routes_name.dart';
import 'utils/firebase_options.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure binding is initialized
  await Firebase.initializeApp();
  await FirebaseApi().initNotifications(); // Initialize Firebase

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      title: 'plants health monitor app',
      theme: AppTheme.darkThemeMode,
      initialRoute: RoutesName.bluetooth,
      onGenerateRoute: Routes.generateRoutes,
    );
  }
}
