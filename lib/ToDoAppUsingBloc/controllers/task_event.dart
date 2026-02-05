part of 'task_bloc.dart';

sealed class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class AddTaskEvent extends TaskEvent {
  final String title;

  const AddTaskEvent(this.title);
  @override
  List<Object> get props => [title];
}

class RemoveTaskEvent extends TaskEvent {
  final String id;

  const RemoveTaskEvent(this.id);
  @override
  List<Object> get props => [id];
}

class ToggleTaskEvent extends TaskEvent {
  final String id;

  const ToggleTaskEvent(this.id);
  @override
  List<Object> get props => [id];
}
