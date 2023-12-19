import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:recipes/colors/recipe_colors.dart';
import 'package:recipes/login_screen.dart';
import 'package:recipes/my_profile.dart';
import 'package:recipes/recipe_details.dart';
import 'package:recipes/register_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'home_screen.dart';

void main() {
  runApp(const MyApp(), );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context , orientation , screenType ) {
        return MaterialApp(
          locale: DevicePreview.locale(context),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.orange,
          ),
          home:HomeScreen(),
        );
      }, );
  }
}