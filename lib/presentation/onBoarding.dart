
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:recipes/colors/recipe_colors.dart';
import 'package:recipes/presentation/login/page/login_screen.dart';
import 'package:recipes/presentation/register/page/register_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../navigators/navigators.dart';
import 'navigation_bar/page/main_screen.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  OnBoardingSlider(
        finishButtonText: 'Register',
        onFinish: () {
          pushReplacement(context, RegisterScreen());
    },
          finishButtonStyle: FinishButtonStyle(
          backgroundColor: RecipesColor.firstColor,
          ),
          skipTextButton: Text(
          'Skip',
          style: TextStyle(
          fontSize: 18.sp,
          color: RecipesColor.firstColor,
          fontWeight: FontWeight.w600,
          ),
          ),
          trailing: Text(
          'Login',
          style: TextStyle(
          fontSize: 18.sp,
          color: RecipesColor.firstColor,
          fontWeight: FontWeight.w600,
          ),
          ),
          trailingFunction: () {
          pushReplacement(context, LoginScreen());

          },
          controllerColor: RecipesColor.firstColor,
          totalPage: 3,
          headerBackgroundColor: Colors.white,
          pageBackgroundColor: Colors.white,
          background: [
          Image.asset(
            'assets/images/giphy.gif',
          height: 400,
          ),
          Image.asset(
            'assets/images/food7.png',
          height: 400,
          ),
          Image.asset(
          'assets/images/food6.png',
          height: 400,
          ),
          ],
          speed: 1.8,
          pageBodies: [
          Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
              const SizedBox(
              height: 480,
              ),
              Text(
                'Welcome To Mum`s Cooking',
              textAlign: TextAlign.center,
              style: TextStyle(
              color:RecipesColor.firstColor,
              fontSize: 24.0,
              fontWeight: FontWeight.w600,
              ),
              ),
              const SizedBox(
              height: 20,
              ),
              const Text(
                'Here you can find a chef or dish for every taste and color. Enjoy!',
              textAlign: TextAlign.center,
              style: TextStyle(
              color: Colors.black26,
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              ),
              ),
              ],
              ),
              ),
           Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                const SizedBox(
                height: 480,
                ),
                Text(
                '',
                textAlign: TextAlign.center,
                style: TextStyle(
                color: RecipesColor.firstColor,
                fontSize: 24.0,
                fontWeight: FontWeight.w600,
                ),
                ),
                const SizedBox(
                height: 20,
                ),
                const Text(
                  'Here you can watch video of each recipe',
                textAlign: TextAlign.center,
                style: TextStyle(
                color: Colors.black26,
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                ),
                ),
                ],
                ),
                ),
            Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                const SizedBox(
                height: 480,
                ),
                Text(
                '',
                textAlign: TextAlign.center,
                style: TextStyle(
                color: RecipesColor.firstColor,
                fontSize: 24.0,
                fontWeight: FontWeight.w600,
                ),
                ),
                const SizedBox(
                height: 20,
                ),
                const Text(
                'Here you can find +1000 recipe',
                textAlign: TextAlign.center,
                style: TextStyle(
                color: Colors.black26,
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                ),
                ),
                ],
                ),
                ),
                ],
          ),
    );
  }
}