part of 'create_user_bloc.dart';

@immutable
abstract class CreateUserState {}

abstract class CreateUserActionState extends CreateUserState {}

class CreateUserInitial extends CreateUserState {}

class CreateUserLoadingState extends CreateUserState {}

class CreateUserErrorState extends CreateUserState {}

class CreateUserSuccessState extends CreateUserState {
  CreateUserModel createUserModel;

  CreateUserSuccessState({required this.createUserModel});
}
