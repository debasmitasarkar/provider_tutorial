import 'package:flutter/material.dart';
import 'package:provider_101/models/task.dart';

class UpComingTasks extends StatelessWidget {
  final List<Task> tasks;

  UpComingTasks(this.tasks);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Upcoming Tasks',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SizedBox(height: 15),
        Expanded(
          child: ListView.separated(
            itemCount: tasks.length,
            separatorBuilder: (context, index) => SizedBox(height: 10),
            itemBuilder: (context, index) {
              return Card(
                color: Colors.grey[900],
                child: Container(
                  height: 50,
                  padding: EdgeInsets.all(10),
                  alignment: FractionalOffset.centerLeft,
                  child: Text(
                    tasks[index].taskName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
