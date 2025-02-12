part of 'users_bloc.dart';

@immutable
abstract class UsersEvent {}

class FetchedInitialEvent extends UsersEvent {}

class LikedButtonClickedEvent extends UsersEvent {
  List<UsersData> usersData;
  int index;

  LikedButtonClickedEvent({required this.usersData, required this.index});
}

class DisLikedButtonClickedEvent extends UsersEvent {
  List<UsersData> usersData;
  int index;

  DisLikedButtonClickedEvent({required this.usersData, required this.index});
}
