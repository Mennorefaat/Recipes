
import 'package:flutter/material.dart';
import 'package:recipes/navigators/navigators.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'login/page/login_screen.dart';
class ThankYou extends StatefulWidget {
  const ThankYou({super.key});

  @override
  State<ThankYou> createState() => _ThankYouState();
}

class _ThankYouState extends State<ThankYou> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(15),
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Thank you for your details!',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
              const SizedBox(height: 15,),
              const Text('Now you can  start exploring best cookers with best dishes.',style: TextStyle(fontSize: 20),),
              const Spacer(),
              Image.asset('assets/images/done800x600.gif',
                fit: BoxFit.fill,
                width: double.infinity,
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height:6.h,
                child: ElevatedButton(
                  onPressed: () {
                    push(context,const LoginScreen());
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.sp),
                    ),
                    backgroundColor: Colors.black,
                  ),
                  child: const Text ('Let`s start!',style: TextStyle(color: Colors.white,fontSize: 20)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
