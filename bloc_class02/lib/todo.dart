import 'package:bloc_class02/bloc/todo/todo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Todo extends StatelessWidget {
  const Todo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TodoBloc, TodoState>(builder: (context, state) {
        return Expanded(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: state.todoList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.todoList[index]),
                    trailing: IconButton(
                        onPressed: () {
                          context
                              .read<TodoBloc>()
                              .add(DeleteTodo(task: state.todoList[index]));
                        },
                        icon: const Icon(Icons.delete)),
                  );
                },
              )
            ],
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          for (var index = 0; index <= 5; index++) {
            context
                .read<TodoBloc>()
                .add(AddTodo(task: "Task For ${index + 1}"));
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
