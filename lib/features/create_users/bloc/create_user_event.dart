part of 'create_user_bloc.dart';

@immutable
abstract class CreateUserEvent {}

class CreateUserButtonClickedEvent extends CreateUserEvent{
  String name;
  String job;
  CreateUserButtonClickedEvent({required this.name, required this.job});

}

