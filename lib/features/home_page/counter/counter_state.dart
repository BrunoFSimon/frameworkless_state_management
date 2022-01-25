abstract class CounterState {}

class CounterInitialState extends CounterState {
  final int count = 0;
}

class CounterLoadingState extends CounterState {}

class CounterSuccessState extends CounterState {
  final int count;
  CounterSuccessState({required this.count});
}

class CounterErrorState extends CounterState {
  final String error;
  CounterErrorState({required this.error});
}
