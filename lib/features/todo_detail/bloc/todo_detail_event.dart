part of 'todo_detail_bloc.dart';

@immutable
abstract class TodoDetailEvent {}

class TodoDetailInitialEvent extends TodoDetailEvent{
  final String id;
  TodoDetailInitialEvent({required this.id});

}

