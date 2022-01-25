import 'package:flutter/material.dart';
import 'package:value_notifier/features/home_page/counter/counter_state.dart';
import 'package:value_notifier/features/home_page/home_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 80,
                height: 80,
                child: Center(
                  child: ValueListenableBuilder<CounterState>(
                      valueListenable: controller.counter,
                      builder: (context, state, child) {
                        if (state is CounterLoadingState) {
                          return const CircularProgressIndicator();
                        }

                        if (state is CounterSuccessState) {
                          return Text(
                            state.count.toString(),
                            style: Theme.of(context).textTheme.headline4,
                          );
                        }

                        if (state is CounterInitialState) {
                          return Text(
                            state.count.toString(),
                            style: Theme.of(context).textTheme.headline4,
                          );
                        }

                        if (state is CounterErrorState) {
                          return Text(
                            state.error,
                            style: Theme.of(context).textTheme.headline4,
                          );
                        }

                        throw Exception('Unknown state');
                      }),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: ValueListenableBuilder<CounterState>(
          valueListenable: controller.counter,
          builder: (context, state, child) {
            late void Function()? onPressed;

            if (state is CounterLoadingState) {
              onPressed = null;
            } else {
              onPressed = controller.counter.increment;
            }

            return FloatingActionButton(
              onPressed: onPressed,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            );
          }),
    );
  }
}
