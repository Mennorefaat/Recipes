import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:recipes/shared/my_shared.dart';
import 'package:recipes/shared/my_shared_keys.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final auth = FirebaseAuth.instance;

  void login({
    required String email,
    required String password,
}) {
emit(LoginLoadingState());
    auth.signInWithEmailAndPassword(
        email: email,
        password: password
    ).then((value) {
      saveUserData();
      emit(LoginSuccessState());
       }) .catchError((error){
      if (error is FirebaseAuthException){

      //   print("message==>"+error.message.toString());
      //
      //   if (error.code == 'invalid-credential') {
      //     print("==>"+error.code.toString());
      //     emit(LoginFailureState('No user found for that email.'));
      //   } else if (error.code == 'wrong-password') {
      //    // emit(LoginFailureState('Wrong password provided for that user.'));
      //   }
      // } else{
        emit(LoginFailureState("pass or email is wrong"));
      }

    }
      );
  }


  void saveUserData() async {
FirebaseFirestore firestore = FirebaseFirestore.instance;
firestore.collection("users").doc(auth.currentUser!.uid.toString()).get().then((value) {
  PreferenceUtils.setString(PrefKeys.email, value.get("email"));
  PreferenceUtils.setString(PrefKeys.name, value.get("name"));
  PreferenceUtils.setString(PrefKeys.email, value.get("image"));
  PreferenceUtils.setString(PrefKeys.phone, value.get("phone"));

});
  }
  }

