import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:recipes/navigators/navigators.dart';
import 'package:recipes/presentation/login/manger/login_cubit.dart';
import 'package:recipes/presentation/navigation_bar/page/main_screen.dart';
import 'package:recipes/presentation/register/page/register_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../colors/recipe_colors.dart';
import '../../forget_password/page/forget_password.dart';
import '../../onBoarding.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool obscureText=true;
  final emailController = TextEditingController();
  var passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final formKey =GlobalKey<FormState>();
  final cubit =LoginCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) => onStateChange(state),
        child: Scaffold(
        backgroundColor: Colors.white,
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
                  Text('Login',style: TextStyle(color: RecipesColor.firstColor,fontWeight: FontWeight.bold,fontSize: 25.sp),),
                  Form(
                    key: formKey,
                    child: Container(
                      margin: EdgeInsets.all(10.sp),
                      child: Column(
                        children: [
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
                            obscureText: obscureText,
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
                              label:Text('PASSWORD',style: TextStyle(color: RecipesColor.secondColor,fontSize: 15,fontWeight: FontWeight.bold),),
                              suffixIcon: IconButton(
                                  onPressed: (){
                                    setState(() {
                                      obscureText=!obscureText;
                                    });
                                  }
                                  , icon:Icon(obscureText? Icons.visibility_off:Icons.visibility,color: RecipesColor.secondColor,)),
                            ),
                          ),
                          SizedBox(height: 2.h),
                          TextButton(
                            style: TextButton.styleFrom(
                              textStyle:  TextStyle(fontSize: 17.sp),
                            ),
                            onPressed: ()  => push(context, const ForgetPassword()),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text('Forget Password?',
                                style: TextStyle(fontWeight: FontWeight.bold,color: RecipesColor.secondColor),),
                            ),
                          ),
                          SizedBox(height: 2.h),
                          SizedBox(
                            width: double.infinity,
                            height:6.h,
                            child: ElevatedButton(
                              onPressed: () =>login(),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.sp),
                                ),
                                backgroundColor: RecipesColor.firstColor,
                              ),
                              child: const Text ('Login',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('Don`t have account?',style: TextStyle(color: Colors.black),),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    textStyle:  TextStyle(fontSize: 15.sp),
                                  ),
                                  onPressed: () {
                                    push(context,const RegisterScreen());
                                  },
                                  child: Text('Create new account',
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
    ),
),
);
  }

void onLoginSuccess(){
    pushReplacement(context, MainScreen());
}
void login(){
  if (!formKey.currentState!.validate()){
    return;
  }
  String email =emailController.text;
  String password =passwordController.text;
  cubit.login(email: email, password: password);
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
void displayToast(String message){
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

  onStateChange( LoginState state) {
    if(state is LoginLoadingState){
      showDialog(context: context, builder: (context) {
        return const Center(child: CircularProgressIndicator(
          color: Colors.orange,
          backgroundColor: Colors.grey,
        ));
      },);
    }
    else if(state is LoginSuccessState){
      onLoginSuccess();
    }
    else if(state is LoginFailureState){
      awesomeDialog(state.errorMessage);
     //displayToast( state.errorMessage);
    }
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}

