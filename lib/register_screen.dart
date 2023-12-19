import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'colors/recipe_colors.dart';
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  bool obscureText1 = true;
  bool obscureText2 = true;
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey =GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController;
    passwordController;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset('assets/image/potato.jpeg',
              fit: BoxFit.fill,
              width: double.infinity,
            ),
            Container(
              margin: EdgeInsets.only(top: 60.sp),
              padding:  EdgeInsets.all(20.sp),
              width: double.infinity,
              decoration:  BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.sp),
                    topRight: Radius.circular(25.sp),
                  )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Register',style: TextStyle(color: RecipesColor.firstColor,fontWeight: FontWeight.bold,fontSize: 25.sp),),
                  Form(
                    key: formKey,
                    child: Container(
                      margin: EdgeInsets.all(10.sp),
                      child: Column(
                        children: [
                          TextFormField(
                            controller:nameController,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.name,
                            decoration:   InputDecoration(
                                label: Text('NAME',style: TextStyle(color: RecipesColor.secondColor,fontSize: 15.sp,fontWeight: FontWeight.bold),)
                            ),
                          ),
                          SizedBox(height: 2.h,),
                          TextFormField(
                            controller: phoneController,
                            textInputAction: TextInputAction.next,
                            maxLength: 11,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              label: Text('PHONE',style: TextStyle(color: RecipesColor.secondColor,fontSize: 15.sp,fontWeight: FontWeight.bold),),
                              suffixIcon: Icon(Icons.phone,color: RecipesColor.secondColor,),
                            ),
                          ),
                          SizedBox(height: 2.h,),
                          TextFormField(
                            controller: emailController,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value){
                              if (value!.isEmpty){
                                return'please enter your email';
                              }
                              if(!value.contains('@')|| !value.contains('.')){
                                return 'Invalid email';
                              }
                              return null;
                            },
                            decoration:   InputDecoration(
                                label: Text('EMAIL ADDRESS',style: TextStyle(color: RecipesColor.secondColor,fontSize: 15,fontWeight: FontWeight.bold),)
                            ),
                          ),
                          SizedBox(height: 2.h,),
                          TextFormField(
                            obscureText: obscureText1,
                            controller: passwordController,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.visiblePassword,
                            validator: (value){
                              if (value!.isEmpty){
                                return'please enter your password';
                              }
                              if(value.length<6){
                                return 'Invalid password';
                              }
                              return null;
                            },
                            decoration:  InputDecoration(
                              label:  Text('PASSWORD',style: TextStyle(color: RecipesColor.secondColor,fontSize: 15.sp,fontWeight: FontWeight.bold),),
                              suffixIcon: IconButton(
                                  onPressed: (){
                                    setState(() {
                                      obscureText1=!obscureText1;
                                    });
                                  }
                                  , icon:Icon(obscureText1? Icons.visibility_off:Icons.visibility,color: RecipesColor.secondColor,)),
                            ),
                          ),
                          SizedBox(height: 2.h,),
                          TextFormField(
                            obscureText: obscureText2,
                            controller: passwordController,
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.visiblePassword,
                            validator: (value){
                              if (value!.isEmpty){
                                return'please enter your password';
                              }
                              if(value.length<6){
                                return 'Invalid password';
                              }
                              return null;
                            },
                            decoration:  InputDecoration(
                              label:  Text('RE-PASSWORD',style: TextStyle(color: RecipesColor.secondColor,fontSize: 15.sp,fontWeight: FontWeight.bold),),
                              suffixIcon: IconButton(
                                  onPressed: (){
                                    setState(() {
                                      obscureText2=!obscureText2;
                                    });
                                  }
                                  , icon:Icon(obscureText2? Icons.visibility_off:Icons.visibility,color:RecipesColor.secondColor,)),
                            ),
                          ),
                          SizedBox(height: 2.h,),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.sp),
                                ),
                                backgroundColor: RecipesColor.firstColor,
                              ),
                              child: Text ('Register',style: TextStyle(color: Colors.black,fontSize: 20.sp,fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('Already have account?',style: TextStyle(color: Colors.black),),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    textStyle: TextStyle(fontSize: 15.sp),
                                  ),
                                  onPressed: () {},
                                  child: Text('Login',
                                    style: TextStyle(fontWeight: FontWeight.bold,color: RecipesColor.firstColor),),
                                )
                              ]
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}

