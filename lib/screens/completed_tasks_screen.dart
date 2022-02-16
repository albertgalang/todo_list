import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../models/task_model.dart';

class CompletedTasksScreen extends StatefulWidget {
  @override
  _CompletedTasksScreenState createState() => _CompletedTasksScreenState();
}

class _CompletedTasksScreenState extends State<CompletedTasksScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Hive.openBox('completedTasks'),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError)
              return Text(snapshot.error.toString());
            else {
              return Container(
                  child: StreamBuilder(
                    stream: Hive.box('completedTasks').watch(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return ListView.separated(
                            itemCount: Hive.box('completedTasks').length,
                            itemBuilder: (context, index) {
                              return TaskCardCompleted(Hive.box('completedTasks').getAt(index), index);
                            },
                            separatorBuilder: (context, index) => Divider()
                            );
                      }
                      return ListView.separated(
                          itemCount: Hive.box('completedTasks').length,
                          itemBuilder: (context, index) {
                            return TaskCardCompleted(Hive.box('completedTasks').getAt(index), index);
                          },
                          separatorBuilder: (context, index) => Divider()
                          );
                    },
                  ),
              );
            }
          } else
            return Scaffold();
        });
  }
}


class TaskCardCompleted extends StatelessWidget {
  // final int index; // index is just a test
  final Task task;
  final index;
  // TaskCard({Key key, this.index}) : super(key: key);
  TaskCardCompleted(this.task, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 0.0),
            leading: IconButton(
              icon: Icon(Icons.check_box),
              iconSize: 18.0,
              onPressed: () {
              }, // on pressed action
            ),
            title: Text(task.title),
          )
        ],
      ),
    );
  }
}