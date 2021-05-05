import 'package:flutter/material.dart';
import 'package:provider_101/models/task.dart';

class TaskNotifier extends ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  addTask(String taskName) {
    _tasks.add(Task(isCompleted: false, taskName: taskName));
    notifyListeners();
  }

  modifyTaskState(bool state, int taskIndex) {
    _tasks[taskIndex].isCompleted = state;
    notifyListeners();
  }
}
