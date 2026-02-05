import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:to_do_app_bloc/ToDoAppUsingCubit/models/task_model.dart';
import 'package:uuid/uuid.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());

  addTask(String title) {
    final model = TaskModel(id: Uuid().v4(), title: title, isCompleted: false);
    print(state.tasksList);
    // way 1 sepred operator
    emit(UpdateTask([...state.tasksList, model]));
    print(state.tasksList);

    // way 2 using List.from
    // emit(UpdateTask(List.from(state.tasksList)..add(model)));
  }

  updateTask(TaskModel updatedTask) {
    final newList = state.tasksList.map((task) {
      return task.id == updatedTask.id ? updatedTask : task;
    }).toList();
    emit(UpdateTask(newList));
  }

  removeTask(String id) {
    final List<TaskModel> newList = state.tasksList
        .where((t) => t.id != id)
        .toList();
    emit(UpdateTask(newList));
  }

  void toggleTask(String id) {
    final newList = state.tasksList.map((task) {
      return task.id == id
          ? task.copyWith(isCompleted: !task.isCompleted)
          : task;
    }).toList();
    emit(UpdateTask(newList));
  }
}
