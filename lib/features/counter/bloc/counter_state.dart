part of 'counter_bloc.dart';

@immutable
abstract class CounterState {}
abstract class CounterActionState extends CounterState{

}


class CounterSnackBarActionState extends CounterActionState{}
class CounterInitial extends CounterState {}

class CounterIncrementState extends CounterState{
  final int value;
  CounterIncrementState({required this.value});

}

class CounterDecrementState extends CounterState{
  final int value;
  CounterDecrementState({required this.value});

}

class CounterIncrementActionState extends CounterActionState{}
class NavigateNextScreenActionState extends CounterActionState{}
