import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../models/task_model.dart';

class EditTask extends StatefulWidget {
  final taskIndex;

  const EditTask({Key key, this.taskIndex}) : super(key: key);

  @override
  _EditTaskState createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: TextField(
        controller: _controller,
        autofocus: true,
        onSubmitted: (value) {
          if (value.isNotEmpty) {
            print('value is: ' + value);
            var newTask = new Task(value, null);
            Hive.box('tasks').putAt(widget.taskIndex, newTask);
            Navigator.pop(context);
          } else {
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}