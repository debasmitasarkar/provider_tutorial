import 'package:flutter/material.dart';
import 'package:provider_101/task_notifier.dart';
import 'package:provider/provider.dart';

import 'package:provider_101/widgets/task_widget.dart';

class TasksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Tasks'),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[850],
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: context.read<TaskNotifier>().tasks.length,
        itemBuilder: (context, index) {
          return TaskWidget(
            onTaskCompleted: (value) {
              context.read<TaskNotifier>().modifyTaskState(value, index);
            },
            task: context.read<TaskNotifier>().tasks[index],
          );
        },
      ),
    );
  }
}
