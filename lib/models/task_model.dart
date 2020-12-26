import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskSimple {
  @HiveField(0)
  String title;
  @HiveField(1)
  bool done = false;

  TaskSimple(this.title);

  bool get isDone => this.done;

  set finished(bool isFinished) => done = isFinished;
  set changeTitle(String title) => this.title = title;
}

@HiveType(typeId: 1)
class Task extends TaskSimple {
  @HiveField(2)
  String description;
  @HiveField(3)
  bool list;

  Task(String title, this.description, {this.list = false}) : super(title);
  Task.quickAdd(String title, this.description, {this.list = false})
      : super(title);

  bool get isList => this.list;
}

// test tasks
List<Task> tasks = [
  Task(
    "Do laundry",
    "only shorts"
  ),
  Task(
    "Study for test",
    "6.1 - 6.3"
  )
];