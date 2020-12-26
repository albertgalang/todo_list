import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:todo_list/screens/completed_tasks_screen.dart';
import 'package:todo_list/screens/home_screen.dart';
import 'package:todo_list/widgets/add_task.dart';

import 'models/task_model.dart';
import 'screens/home_screen.dart';
// import 'widgets/app_bar.dart';
// import 'widgets/app_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory =
    await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(TaskAdapter());
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: HomeScreen(),
    // );
    return DefaultTabController(
      length: 2,
      child: MaterialApp(
              home: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.check_box_outline_blank), text: "Tasks"),
                Tab(icon: Icon(Icons.check_box), text: "Completed")
              ]
            ),
            title: Text("Simple To Do App"),
          ),
          body: TabBarView(
            children: [
              HomeScreen(),
              CompletedTasksScreen()
            ]
          ),
          floatingActionButton: Builder(
            builder: (context) => FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return AddTask();
                  }
                );
              }
            )
          ),
        ),
      )
    );
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}

