import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:to_do_app_bloc/ToDoAppUsingCubit/models/task_model.dart';
import 'package:uuid/uuid.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskInitial()) {
    // Add Task
    on<AddTaskEvent>((event, emit) {
      final task = TaskModel(
        id: const Uuid().v4(),
        title: event.title,
        isCompleted: false,
      );

      emit(TaskUpdated([...state.tasksList, task]));
    });

    // Remove Task
    on<RemoveTaskEvent>((event, emit) {
      final List<TaskModel> newList = state.tasksList
          .where((t) => t.id != event.id)
          .toList();

      emit(TaskUpdated(newList));
    });

    // Toggle Task
    on<ToggleTaskEvent>((event, emit) {
      final List<TaskModel> newList = state.tasksList.map((task) {
        return task.id == event.id
            ? task.copyWith(isCompleted: !task.isCompleted)
            : task;
      }).toList();

      emit(TaskUpdated(newList));
    });
  }
}
