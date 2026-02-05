part of 'task_bloc.dart';

sealed class TaskState extends Equatable {
  List<TaskModel> tasksList;
  TaskState(this.tasksList);

  @override
  List<Object> get props => [tasksList];
}

final class TaskInitial extends TaskState {
  TaskInitial() : super([]);
}

class TaskUpdated extends TaskState {
  TaskUpdated(List<TaskModel> tasks) : super(tasks);
}
