part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent {}




class NavigateTodoDetailEvent extends TodoEvent{
  final String id;
  NavigateTodoDetailEvent({required this.id});
}

class TodoInitialEvent extends TodoEvent{

}


