import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes/add.dart';
import 'package:recipes/presentation/home/page/home_screen.dart';
import 'package:recipes/presentation/login/page/login_screen.dart';
import 'package:recipes/presentation/navigation_bar/page/main_screen.dart';
import 'package:recipes/presentation/onBoarding.dart';
import 'package:recipes/presentation/recipe_details/page/recipe_details.dart';
import 'package:recipes/presentation/side%20menu/manager/theme_cubit.dart';
import 'package:recipes/shared/my_shared.dart';
import 'package:recipes/shared/my_shared_keys.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceUtils.init();
  await Firebase.initializeApp();
  runApp(const MyApp(),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return BlocProvider(
          create: (context) => ThemeCubit(),
          child: BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return MaterialApp(
                locale: DevicePreview.locale(context),
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  brightness: Brightness.light,
                  primarySwatch: Colors.blueGrey,
                  appBarTheme: const AppBarTheme(
                      color: Colors.white,
                      titleTextStyle: TextStyle(
                        color: Colors.black,
                      )
                    ),
                  textTheme: TextTheme(
                    titleMedium: TextStyle(
                      fontSize:18.sp,
                      color: Colors.black,
                    ),
                    titleLarge: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize:10.sp,
                      color: Colors.black,
                    ),
                    titleSmall: TextStyle(
                      fontSize:15.sp,
                      color: Colors.black,
                    ),
                  ),
                ),
                darkTheme: ThemeData(
                  brightness: Brightness.dark,
                    primarySwatch: Colors.grey,
                    appBarTheme: const AppBarTheme(
                      color: Colors.black,
                        titleTextStyle: TextStyle(
                          color: Colors.white,
                        ),
                    ),
                    textTheme: TextTheme(
                      titleMedium: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.white,
                      ),
                      titleLarge: TextStyle(
                        fontSize: 25.sp,
                        color: Colors.white,
                      ),
                      titleSmall: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.white,
                      ),
                    ),
                ),
                themeMode: PreferenceUtils.getBool(PrefKeys.darkTheme)
                    ? ThemeMode.dark
                    : ThemeMode.light,
                home: FirebaseAuth.instance.currentUser == null ?
                const OnBoarding() :
                const MainScreen(),

              );
            },
          ),
        );
      },);
  }
}