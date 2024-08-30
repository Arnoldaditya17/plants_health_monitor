import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'AppDrawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
      ),
      drawer: const AppDrawer(),
      body: Card(
        child: SvgPicture.asset('assets/icons/plant.svg'),
      ),
    );
  }
}
