import 'package:flutter/material.dart';
import 'package:provider_101/models/task.dart';
import 'package:provider_101/tasks_page.dart';
import 'package:provider_101/widgets/create_task_widget.dart';
import 'package:provider_101/widgets/upcoming_tasks.dart';

_CreateTaskPageState createTaskPageState;

class CreateTaskPage extends StatefulWidget {
  @override
  _CreateTaskPageState createState() {
    createTaskPageState = _CreateTaskPageState();
    return createTaskPageState;
  }
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  // Tasks list used everywhere
  List<Task> tasks = [];

  @override
  void initState() {
    super.initState();
  }

  List<Task> getUpcomingTasks() {
    List<Task> upComingCompletedTasks =
        tasks.where((t) => t.isCompleted == false).toList();
    if (upComingCompletedTasks.length > 3) {
      return upComingCompletedTasks.sublist(0, 3);
    }
    return upComingCompletedTasks;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Task'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TasksPage(tasks),
                  ));
            },
            icon: Icon(Icons.all_inbox),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        color: Colors.grey[850],
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            CreateTaskWidget(
              onAddTask: (String taskName) {
                tasks.add(Task(isCompleted: false, taskName: taskName));
                setState(() {});
              },
            ),
            SizedBox(height: 20),
            Flexible(
              child: UpComingTasks(getUpcomingTasks()),
            ),
          ],
        ),
      ),
    );
  }
}
