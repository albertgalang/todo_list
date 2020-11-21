import 'package:flutter/material.dart';
import 'package:todo_list/widgets/app_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: Container(
        child: ListView.separated(
          padding: EdgeInsets.all(10.0),
          itemCount: 20,
          itemBuilder: (context, index) {
            return TaskCard(index : index); // index is just a test
          },
          separatorBuilder: (context, index) => Divider(),
        ),
      ),
    );
  }
}


class TaskCard extends StatelessWidget {
  final int index; // index is just a test
  final String title = "Do laundry";
  TaskCard({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.check_box_outline_blank, size: 18.0),
            title: Text(title),
          )
        ],
      ),
    );
  }
}
