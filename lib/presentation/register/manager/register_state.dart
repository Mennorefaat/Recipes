part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoadingState extends RegisterState{}

class RegisterSuccessState extends RegisterState{}

class RegisterFailureState extends RegisterState{

  final String errorMessage;

  RegisterFailureState(this.errorMessage);
}
