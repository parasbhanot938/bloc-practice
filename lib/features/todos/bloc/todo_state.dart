part of 'todo_bloc.dart';

@immutable
abstract class TodoState {}
class TodoActionState  extends TodoState{}
class NavigateTodoDetailActionState extends TodoActionState {
  final String id;
  NavigateTodoDetailActionState({required this.id});
}






class TodoInitial extends TodoState {}

class TodoLoadingState extends TodoState{}


class TodoErrorState extends TodoState{
  final String message;
  TodoErrorState({required this.message});


}

class TodoSuccessState extends TodoState{
  final List<TodoModel> list;

  TodoSuccessState({required this.list});


}

