import 'package:flutter/material.dart';
import 'package:to_do_app/task_box_btns.dart';

// ignore: must_be_immutable
class NewTaskDialogBox extends StatelessWidget {
  final mycontroller;
  VoidCallback onSave;
  VoidCallback onCancel;

  NewTaskDialogBox({
    super.key,
    required this.mycontroller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[900],
      content: Container(
        height: 200,
        width: 500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // get task from user
            TextField(
              cursorColor: Colors.white,
              style: TextStyle(color: Colors.white),
              autofocus: true,
              controller: mycontroller,
              decoration: InputDecoration(
                hoverColor: const Color.fromARGB(255, 255, 255, 255),
                fillColor: Colors.grey[900],
                filled: true,
                hintText: "Add new task",
                hintStyle: TextStyle(color: Colors.grey[600]),
                enabledBorder: const OutlineInputBorder(
                  // width: 0.0 produces a thin "hairline" border
                  borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14.0),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                border: const OutlineInputBorder(),
                //labelStyle: new TextStyle(color: Colors.green),
              ),
            ),

            // buttons : add / cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  shape: CircleBorder(),
                  onPressed: onSave,
                  backgroundColor: Colors.indigoAccent,
                  child: Icon(size: 32, color: Colors.grey[900], Icons.add),
                ),
                SizedBox(width: 12),
                FloatingActionButton(
                  shape: CircleBorder(),
                  onPressed: onCancel,
                  backgroundColor: Colors.redAccent,
                  child: Icon(size: 32, color: Colors.grey[900], Icons.close),
                ),
                //add btn
                /*
  FloatingActionButton(
                  onPressed: onSave,
                  child: Icon(Icons.add),
                ),
                */

                //ElevatedButton(onPressed: onSave, child: Icon(Icons.add)),
                //IconButton(color: Colors.white, onPressed: onSave, icon: Icon(size: 32, color: Colors.greenAccent[400], Icons.add_circle)),
                // TaskBoxBtns(text: "Add", onPressed: onSave),
                SizedBox(width: 5),
                //cancel btn
                //IconButton(onPressed: onCancel, icon: Icon(size: 32, color: Colors.redAccent, Icons.cancel)),
                //TaskBoxBtns(text: "Cancel", onPressed: onCancel),
              ],
            )
          ],
        ),
      ),
    );
  }
}
