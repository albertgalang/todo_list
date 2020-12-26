import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../models/task_model.dart';

class AddTask extends StatefulWidget {
  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: TextField(
        controller: _controller,
        autofocus: true,
        onSubmitted: (value) {
          if (value.isNotEmpty) {
            print('value is: ' + value);
            var newTask = new Task(value, null);
            Hive.box('tasks').add(newTask);
            Navigator.pop(context);
          } else {
            print('value is: ' + value);
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}