import 'package:flutter/material.dart';

class CreateTaskWidget extends StatelessWidget {
  final Function(String) onAddTask;

  CreateTaskWidget({
    @required this.onAddTask,
  });

  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextField(
            controller: _controller,
            style: TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                textStyle: TextStyle(fontWeight: FontWeight.w400)),
            onPressed: () {
              onAddTask(_controller.text);
            },
            child: Text('Create Task'),
          ),
        ],
      ),
    );
  }
}
