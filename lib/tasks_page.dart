import 'package:flutter/material.dart';
import 'package:provider_101/create_task_page.dart';
import 'package:provider_101/models/task.dart';
import 'package:provider_101/widgets/task_widget.dart';

class TasksPage extends StatefulWidget {
  final List<Task> tasks;
  TasksPage(this.tasks);
  @override
  _TasksPageState createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
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
        itemCount: widget.tasks.length,
        itemBuilder: (context, index) {
          return TaskWidget(
            onTaskCompleted: (value) {
              widget.tasks[index].isCompleted = value;
              createTaskPageState.setState(() {});
              setState(() {});
            },
            task: widget.tasks[index],
          );
        },
      ),
    );
  }
}
