import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  final List <Widget> screens = <Widget>[
    //const EFirstScreen(),
    const SizedBox(),
    // const EProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: bar(),
      body: screens[currentIndex],
    );
  }
}