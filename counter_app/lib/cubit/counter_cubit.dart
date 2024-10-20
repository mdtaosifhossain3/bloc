import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  // initialState: initially ja thke. like amr ekta counter app ache. oitar value change korte chai .so my initial state will be 0,

  CounterCubit() : super(0);

  void incrementCounter() {
    emit(state + 1);
    print(state);
  }
}
