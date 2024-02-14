import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:recipes/navigators/navigators.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../login/page/login_screen.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(child: ui()),
          ],
        ),
      ),
    );
  }

  Widget ui() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: formKey,
        child: Expanded(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                Image.asset("assets/images/forget.gif",
                  fit: BoxFit.cover,
                  width: 70.w,height: 30.h,),
                const Text(
                  "Forgot Password",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Please enter your email address to recover your password.',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),),
                const SizedBox(height: 10),
                TextFormField(
                  controller: emailController,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Empty email';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email, color: Colors.black54,),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 5.h,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      resetPassword();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.sp),
                      ),
                    ),
                    child: const Text ('Reset Password',
                      style: TextStyle(color: Colors.white),),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 50.w,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(shape: const StadiumBorder()),
                    onPressed: () => pop(context, const LoginScreen()),
                    child: const Text ('Go back',style: TextStyle(color: Colors.black),),
                  ),
                ),
              ]
          ),
        ),
      ),
    );
  }

  void displayToast(String message) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  void resetPassword() async {
    showDialog(context: context,
        barrierDismissible: false,
        builder: (context) =>
        const Center(child: CircularProgressIndicator(),));

    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());

      Fluttertoast.showToast(msg: 'Password Reset Email Sent! .');

      // ignore: use_build_context_synchronously
      Navigator.of(context).popUntil((route) => route.isFirst);
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      Fluttertoast.showToast(msg: e.message.toString());
      Navigator.of(context).pop();
    }
  }


  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

}
