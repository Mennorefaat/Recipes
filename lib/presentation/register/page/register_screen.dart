import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:recipes/presentation/register/manager/register_cubit.dart';
import 'package:recipes/presentation/thankYou.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../colors/recipe_colors.dart';
import '../../../navigators/navigators.dart';
import '../../login/page/login_screen.dart';
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final String emailPhoto = 'assets/images/email-svgrepo-com.svg';
  final String google = 'assets/images/google-svgrepo-com.svg';
  final String facebook = 'assets/images/facebook-svgrepo-com.svg';
  bool agree =false;



  bool obscureText1 = true;
  bool obscureText2 = true;
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController1 = TextEditingController();
  final passwordController2 = TextEditingController();
  final formKey =GlobalKey<FormState>();
  final cubit =RegisterCubit();

  @override
  void initState() {
    super.initState();
    emailController;
    passwordController1;
    passwordController2;
    phoneController;
    nameController;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocListener<RegisterCubit, RegisterState>(
        listener: (context, state) => onStateChange(state),
        child: Scaffold(
          body: SingleChildScrollView(
            child: Stack(
            children: [
              Image.asset('assets/images/potato.jpeg',
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
                  Text('Register',
                    style: TextStyle(color: RecipesColor.firstColor,fontWeight: FontWeight.bold,fontSize: 25.sp),),
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
                            validator: (value){
                              if (value!.isEmpty){
                                return'please enter your name';
                              }
                              return null;
                            },
                            decoration:   InputDecoration(
                                label: Text('NAME',style: TextStyle(color: RecipesColor.secondColor,fontSize: 15.sp,fontWeight: FontWeight.bold),)
                            ),
                          ),
                          SizedBox(height: 2.h,),
                          TextFormField(
                            controller: phoneController,
                            textInputAction: TextInputAction.next,
                            maxLength: 11,
                            validator: (value){
                              if (value!.isEmpty){
                                return'please enter your phone';
                              }
                              if(!value.contains('01')){
                                return 'wrong phone';
                              }
                              if(value.length!=11){
                                return 'length must be equal 11';
                              }
                              return null;
                            },
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
                            controller: passwordController1,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.visiblePassword,
                            validator: (value){
                              if (value!.isEmpty){
                                return'please enter your password';
                              }
                              if(value.length<6){
                                return 'Invalid password';
                              }
                              if(passwordController2.text != value){
                                return "password doesn't match";
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
                            controller: passwordController2,
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.visiblePassword,
                            validator: (value){
                              if (value!.isEmpty){
                                return'please enter your password';
                              }
                              if(value.length<6){
                                return 'Invalid password';
                              }
                              if(passwordController1.text != value){
                                return "password doesn't match";
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
                          Row(
                            children: [
                              Checkbox(
                                hoverColor: RecipesColor.firstColor,
                                focusColor: RecipesColor.firstColor,
                                checkColor: Colors.white,
                              value: agree,
                              onChanged: (value) {
                                setState(() {
                                  agree = value ?? false;
                                });
                              }
                              ),
                              const Text('I agree with ',style: TextStyle(color: Colors.grey),),
                              Text('Terms and Conditions',style: TextStyle(color: RecipesColor.orangeColor,fontWeight: FontWeight.bold),)
                            ],
                          ),
                          SizedBox(height: 2.h,),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: agree ?(){
                               if(formKey.currentState!.validate()){
                                 String email =emailController.text;
                                 String password =passwordController1.text;
                                 cubit.createAccount(email, password);
                               }
                                } : null,
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.sp),
                                ),
                                //backgroundColor: RecipesColor.firstColor,
                              ),
                              child: Text ('Register',
                                  style: TextStyle(
                                  color: Colors.black,fontSize: 18.sp,
                                  fontWeight: FontWeight.bold)),
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
                                  onPressed: () {
                                   pop(context, const LoginScreen());
                                  },
                                  child: Text('Login',
                                    style: TextStyle(fontWeight: FontWeight.bold,color: RecipesColor.firstColor),),
                                ),
                              ]
                          ),
                           const Row(
                             crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                             Text("____________________",style: TextStyle(color: Colors.grey),),
                              SizedBox(width: 5,),
                              Text('or',style: TextStyle(fontWeight: FontWeight.bold),),
                              SizedBox(width: 5,),
                              Text("____________________",style: TextStyle(color: Colors.grey),),
                            ],
                          ),
                            SizedBox(height: 2.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SvgPicture.asset(
                              emailPhoto,
                              semanticsLabel: 'email'
                              ),
                              SvgPicture.asset(
                                  google,
                                  semanticsLabel: 'google'
                              ),
                              SvgPicture.asset(
                                  facebook,
                                  semanticsLabel: 'facebook'
                              ),
                            ],
                          )
                          
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
    ),
),
);
  }

  void awesomeDialog(String message){
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.rightSlide,
      // title: message,
      desc: message,
      //btnCancelOnPress: () {},
      btnOkOnPress: () => Navigator.pop(context),
    ).show();
  }

  void onRegisterSuccess() {
    cubit.saveUserData(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text);
    Fluttertoast.showToast(msg: "Account Created!");
    Navigator.pop(context);
    pushReplacement(context, const ThankYou());

  }

  onStateChange( RegisterState state) {
    if(state is RegisterLoadingState){
      showDialog(context: context, builder: (context) {
        return const Center(
            child: CircularProgressIndicator(
          color: Colors.orange,
          backgroundColor: Colors.grey,
        ));
      },);
    }
    else if(state is RegisterSuccessState){
      onRegisterSuccess();
    }
    else if(state is RegisterFailureState){
      awesomeDialog(state.errorMessage);
    }
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController1.dispose();
    passwordController2.dispose();
  }

}

