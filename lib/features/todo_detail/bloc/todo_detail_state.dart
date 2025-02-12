part of 'todo_detail_bloc.dart';

@immutable
abstract class TodoDetailState {}
abstract class TodoDetailActionState extends TodoDetailState{}
class TodoDetailInitial extends TodoDetailState {}




class TodoDetailLoadingState extends TodoDetailState{}
class ToDoDetailSuccessState extends TodoDetailState{
  final TodoModel todoModel;
  ToDoDetailSuccessState({required this.todoModel});

}

class TodoDetailErrorState extends TodoDetailState{
  final String message;
  TodoDetailErrorState({required this.message});

}

