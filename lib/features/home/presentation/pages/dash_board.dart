import 'package:flutter/material.dart';
import 'package:plant_health_monitor/features/home/presentation/widgets/app_drawer.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF85C748),
        title: Text("data"),
        

      ),
        drawer: const AppDrawer(),
      body: Text("data"),
    );
  }
}
