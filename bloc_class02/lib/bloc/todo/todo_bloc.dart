import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  var todo = [];
  TodoBloc() : super(const TodoState()) {
    on<AddTodo>((event, emit) {
      todo.add(event.task);
      emit(state.copyWith(todoList: List.from(todo)));
    });

    on<DeleteTodo>((event, emit) {
      todo.remove(event.task);
      emit(state.copyWith(todoList: List.from(todo)));
    });
  }
}
