class TaskSimple {
  String title;
  bool done = false;

  TaskSimple(this.title);

  bool get isDone => this.done;

  set finished(bool isFinished) => done = isFinished;
  set changeTitle(String title) => this.title = title;
}

class Task extends TaskSimple {
  String description;
  bool list;

  Task(String title, this.description, {this.list = false}) : super(title);
  Task.quickAdd(String title, this.description, {this.list = false})
      : super(title);

  bool get isList => this.list;
}

