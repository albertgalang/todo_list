import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_list/models/task_model.dart';
// import 'package:todo_list/widgets/add_task.dart';
// import 'package:todo_list/widgets/app_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Hive.openBox('tasks'),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError)
              return Text(snapshot.error.toString());
            else {
              return Container(
                  child: StreamBuilder(
                    stream: Hive.box('tasks').watch(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return ListView.separated(
                            itemCount: Hive.box('tasks').length,
                            itemBuilder: (context, index) {
                              return TaskCard(Hive.box('tasks').getAt(index), index);
                            },
                            separatorBuilder: (context, index) => Divider()
                            );
                      }
                      return ListView.separated(
                          itemCount: Hive.box('tasks').length,
                          itemBuilder: (context, index) {
                            return TaskCard(Hive.box('tasks').getAt(index), index);
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

class TaskCard extends StatelessWidget {
  // final int index; // index is just a test
  final Task task;
  final index;
  // TaskCard({Key key, this.index}) : super(key: key);
  TaskCard(this.task, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 0.0),
            leading: IconButton(
              icon: Icon(Icons.check_box_outline_blank),
              iconSize: 18.0,
              onPressed: () {
                Hive.box('completedTasks').add(task);
                Hive.box('tasks').deleteAt(index);
              }, // on pressed action
            ),
            title: Text(task.title),
          )
        ],
      ),
    );
  }
}