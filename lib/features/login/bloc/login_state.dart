part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class  LoginInitial extends LoginState {}

class LoginActionState extends LoginState {}

class NavigateToDosActionState extends LoginActionState{}
class LoginSnackBarActionState extends LoginActionState{
  final String token;
  LoginSnackBarActionState({required this.token});
}

class LoginErrorState extends LoginState {
  final String message;
   String? errorMessage;

  LoginErrorState({required this.message,this.errorMessage});
}


class LoginInitialState extends LoginState{

}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final String token;
  LoginSuccessState({required this.token});
}

