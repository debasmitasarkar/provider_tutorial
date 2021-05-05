import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_101/models/task.dart';
import 'package:provider_101/task_notifier.dart';
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
  @override
  void initState() {
    super.initState();
  }

  List<Task> getUpcomingTasks(TaskNotifier taskNotifier) {
    List<Task> tasks = taskNotifier.tasks;
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
                    builder: (context) => TasksPage(),
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
                TaskNotifier taskNotifier =
                    Provider.of<TaskNotifier>(context, listen: false);
                taskNotifier.addTask(taskName);
              },
            ),
            SizedBox(height: 20),
            Flexible(
              child: Consumer<TaskNotifier>(
                builder: (context, taskNotifier, child) =>
                    UpComingTasks(getUpcomingTasks(taskNotifier)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
