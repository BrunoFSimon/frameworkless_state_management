import 'package:flutter/material.dart';
import 'package:value_notifier/features/home_page/counter/counter_state.dart';

class Counter extends ValueNotifier<CounterState> {
  Counter(value) : super(value);
  int count = 0;

  void increment() async {
    value = CounterLoadingState();
    await Future.delayed(const Duration(seconds: 1));
    try {
      count++;
      value = CounterSuccessState(count: count);
    } catch (e) {
      value = CounterErrorState(error: e.toString());
    }
  }
}
