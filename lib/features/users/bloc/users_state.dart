part of 'users_bloc.dart';

@immutable
abstract class UsersState {}
abstract class UsersActionState extends UsersState {}

class DisLikedUserState extends UsersState{
  List<UsersData> usersDataList;
  DisLikedUserState({required this.usersDataList});

}
class LikedUserState extends UsersState{
  List<UsersData> usersDataList;
  LikedUserState({required this.usersDataList});

}

class UsersLoadingState extends UsersState {}
class UsersInitial extends UsersState {}

class UsersSuccessState extends UsersState {
  List<UsersData> list;

  UsersSuccessState({required this.list});
}

class UsersErrorState extends UsersState {
  String errorMessage;

  UsersErrorState({required this.errorMessage});
}

