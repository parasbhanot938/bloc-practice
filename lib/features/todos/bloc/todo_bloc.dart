import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_practice/features/todos/model/todo_model.dart';
import 'package:bloc_practice/features/todos/repo/todo_repo.dart';
import 'package:meta/meta.dart';

part 'todo_event.dart';

part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitial()) {
    on<TodoInitialEvent>(todoInitialEvent);
    on<NavigateTodoDetailEvent>(navigateTodoDetailEvent);
  }

  FutureOr<void> todoInitialEvent(
      TodoInitialEvent event, Emitter<TodoState> emit) async {
    emit(TodoLoadingState());

    List<TodoModel> todoList = await TodoRepo.getTodos();

    if (todoList.isNotEmpty) {
      emit(TodoSuccessState(list: todoList));
    } else {
      emit(TodoErrorState(message: "Something went wrong"));
    }
  }

  FutureOr<void> navigateTodoDetailEvent(
      NavigateTodoDetailEvent event, Emitter<TodoState> emit) {
    emit(NavigateTodoDetailActionState(id: event.id));
  }
}
