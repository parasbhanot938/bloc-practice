import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_practice/features/login/repo/login_repo.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginButtonClickedEvent>(loginButtonClickedEvent);
    on<TryAgainButtonClickedEvent>(tryAgainButtonClickedEvent);
    on<NavigateTodoScreenButtonEvent>(navigateTodoScreenButtonEvent);
    on<LoginInitialEvent>(loginInitialEvent);
  }

  FutureOr<void> loginButtonClickedEvent(
      LoginButtonClickedEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoadingState());

    String token =
        await LoginRepo.loginApi(email: event.email, password: event.password);
    // emit(LoginSnackBarActionState(token: token));

    if (token != "") {
      emit(LoginSuccessState(token: token));
    } else {
      emit(LoginErrorState(message: "Something went wrong"));
    }
  }

  FutureOr<void> tryAgainButtonClickedEvent(
      TryAgainButtonClickedEvent event, Emitter<LoginState> emit) {
    emit(LoginInitialState());

  }

  FutureOr<void> navigateTodoScreenButtonEvent(
      NavigateTodoScreenButtonEvent event, Emitter<LoginState> emit) {
    emit(NavigateToDosActionState());
  }

  FutureOr<void> loginInitialEvent(LoginInitialEvent event, Emitter<LoginState> emit) {

    emit(LoginInitialState());
  }
}

