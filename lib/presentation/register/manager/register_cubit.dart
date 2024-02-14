import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;


  void createAccount(String email,String password) async{
    try {
      final credential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(RegisterSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterFailureState("The password provided is too weak."));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterFailureState("The account already exists for that email."));
      }
    } catch (e) {
      emit(RegisterFailureState(e.toString()));

    }
  }


  void saveUserData({required String name,required String phone,required String email}) {
    final userId = auth.currentUser!.uid;
    final data = {
      'id': userId,
      'name': name,
      'phone':phone,
      'email': email,
      'imageUrl': ''
    };

    fireStore.collection("users").doc(userId).set(data);
  }
}
