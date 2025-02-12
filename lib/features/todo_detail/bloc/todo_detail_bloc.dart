import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_practice/features/todo_detail/repo/todo_detail_repo.dart';
import 'package:bloc_practice/features/todos/model/todo_model.dart';
import 'package:meta/meta.dart';

part 'todo_detail_event.dart';

part 'todo_detail_state.dart';



class TodoDetailBloc extends Bloc<TodoDetailEvent, TodoDetailState> {
  TodoDetailBloc() : super(TodoDetailInitial()) {
    on<TodoDetailInitialEvent>(todoDetailInitialEvent);
    // on<NavigateTodoDetailEvent>(navigateTodoDetailEvent);
  }

  FutureOr<void> navigateTodoDetailEvent(
      event, Emitter<TodoDetailState> emit) async {}

  FutureOr<void> todoDetailInitialEvent(
      TodoDetailInitialEvent event, Emitter<TodoDetailState> emit) async {
    emit(TodoDetailLoadingState());

    TodoModel todoModel =
        await TodoDetailRepo.todoById(id: event.id.toString());
    if (todoModel != null) {
      emit(ToDoDetailSuccessState(todoModel: todoModel));
    } else {
      emit(TodoDetailErrorState(message: "Something went wrong"));
    }
  }
}
