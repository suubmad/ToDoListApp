import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDolist = [];
  //  reference box
  final _myBox = Hive.box('mybox');

  // run this if first time  opening app
  void createData() {
    toDolist = [
      [
        "Task 1",
        false
      ],
      [
        "Task 2",
        false
      ],
    ];
  }

  // Load data from database
  void loadData() {
    // hide for emulator test
    toDolist = _myBox.get("TODOLIST");
  }

  // update database
  void updateData() {
    _myBox.put("TODOLIST", toDolist);
  }
}
