import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';

part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<CounterEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<CounterIncrementEvent>(counterIncrementEvent);
    on<CounterDecrementEvent>(counterDecrementEvent);
    on<CounterSnackBarEvent>(counterSnackBarEvent);
    on<NavigateNextScreenEvent>(navigateNextScreenEvent);
  }

  int value = 0;

  FutureOr<void> counterIncrementEvent(
      CounterIncrementEvent event, Emitter<CounterState> emit) {
    value = value + 1;
    emit(CounterIncrementState(value: value));
  }

  FutureOr<void> counterDecrementEvent(
      CounterDecrementEvent event, Emitter<CounterState> emit) {
    if (value > 0) {
      value = value - 1;
      emit(CounterDecrementState(value: value));
    }
  }

  FutureOr<void> counterSnackBarEvent(
      CounterSnackBarEvent event, Emitter<CounterState> emit) {
    emit(CounterSnackBarActionState());
  }

  FutureOr<void> navigateNextScreenEvent(
      NavigateNextScreenEvent event, Emitter<CounterState> emit) {
    emit(NavigateNextScreenActionState());

  }
}
