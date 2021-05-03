import 'package:flutter/material.dart';
import 'package:provider_101/models/task.dart';

class TaskWidget extends StatefulWidget {
  final Task task;
  final Function(bool) onTaskCompleted;

  TaskWidget({
    this.task,
    this.onTaskCompleted,
    Key key,
  }) : super(key: key);

  @override
  _TaskWidgetState createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[900],
      child: Container(
        height: 50,
        padding: EdgeInsets.all(10),
        alignment: FractionalOffset.centerLeft,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            widget.task.taskName,
            style: TextStyle(
              decoration: widget.task.isCompleted
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
              color: Colors.white,
              fontSize: 15,
              fontStyle:
                  widget.task.isCompleted ? FontStyle.italic : FontStyle.normal,
            ),
          ),
          Checkbox(
            checkColor: Colors.white,
            activeColor: Colors.green,
            value: widget.task.isCompleted,
            onChanged: (value) => widget.onTaskCompleted(value),
          )
        ]),
      ),
    );
  }
}
