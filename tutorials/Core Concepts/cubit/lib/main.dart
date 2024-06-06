import 'dart:async';

import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int>{
  CounterCubit(): super(0);

  void increment() => emit(state+1);
  void decrement() => emit(state-1);

}

// void main(){
//   final counter = CounterCubit();
//   print(counter.state);
//   counter.increment();
//   print(counter.state);
//   counter.increment();
//   print(counter.state);
//   counter.decrement();
//   print(counter.state);
//
//   counter.close();
//
// }

Future<void> main() async {
  final counter = CounterCubit();
  final streamSubscription = counter.stream.listen(print);

  counter.increment();
  counter.increment();
  counter.decrement();
  counter.increment();

  await Future.delayed(const Duration(seconds: 0));
  await streamSubscription.cancel();
  await counter.close();
}


