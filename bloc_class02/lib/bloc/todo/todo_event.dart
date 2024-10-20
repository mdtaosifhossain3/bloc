part of 'todo_bloc.dart';

sealed class TodoEvent extends Equatable {
  const TodoEvent();
}

class AddTodo extends TodoEvent {
  final String task;
  const AddTodo({required this.task});
  @override
  List<Object?> get props => [task];
}

class DeleteTodo extends TodoEvent {
  final Object task;
  const DeleteTodo({required this.task});
  @override
  List<Object?> get props => [task];
}
