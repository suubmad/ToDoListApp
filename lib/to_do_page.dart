import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/database.dart';
import 'package:to_do_app/new_task_box.dart';
import 'package:to_do_app/to_do_list.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  // reference hive box
  final _myBox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();

  final title = "To Do List";

  @override
  void initState() {
    // if this is fist time opening app
    if (_myBox.get("TODOLIST") == null) {
      db.createData();
    } else {
      // if there is data
      db.loadData();
    }
    super.initState();
  }

  // text controller
  final _mycontroller = TextEditingController();
  // list of tasks

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        foregroundColor: Colors.black,
        title: Center(child: Text(title)),
      ),
      // add new task btn
      floatingActionButton: FloatingActionButton(
        //autofocus: true,
        shape: CircleBorder(),
        backgroundColor: Colors.indigoAccent,
        onPressed: addNewTask,
        child: Icon(size: 32, color: Colors.grey[900], Icons.add),
      ),

      body: ListView.builder(
        itemCount: db.toDolist.length,
        itemBuilder: (context, index) {
          return to_do_list(
            taskName: db.toDolist[index][0],
            TaskDone: db.toDolist[index][1],
            onChanged: (value) => checkboxChanged(value, index),
            deleteTaskFunc: (context) => deleteTask(index),
          );
        },
      ),
    );
  }

  // checkbox tapped
  void checkboxChanged(bool? value, int index) {
    setState(() {
      db.toDolist[index][1] = !db.toDolist[index][1];
    });
    db.updateData();
  }

  // delete task
  void deleteTask(int index) {
    setState(() {
      db.toDolist.removeAt(index);
    });
    db.updateData();
  }

  // save new task
  void SaveNewTask() {
    setState(() {
      db.toDolist.add([
        _mycontroller.text,
        false
      ]);
      _mycontroller.clear();
    });

    Navigator.of(context).pop();
    db.updateData();
  }

  // add new task to list
  void addNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return NewTaskDialogBox(
          mycontroller: _mycontroller,
          onSave: SaveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }
}
