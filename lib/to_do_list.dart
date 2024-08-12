import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class to_do_list extends StatelessWidget {
  final String taskName;
  final bool TaskDone;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteTaskFunc;
  Function()? onPressed;

  //bool slider = false;

  to_do_list({
    super.key,
    required this.taskName,
    required this.TaskDone,
    required this.onChanged,
    required this.deleteTaskFunc,
  });

  @override
  Widget build(BuildContext context) {
    //slideHint();
    return Padding(
      padding: const EdgeInsets.only(left: 0, right: 0, top: 5),
      child: Container(
        child: Slidable(
          // end means right

          endActionPane: ActionPane(
            dragDismissible: true,
            motion: StretchMotion(),
            children: [
              SlidableAction(
                //label: "delete",

                onPressed: deleteTaskFunc,
                autoClose: true,
                icon: Icons.delete,
                foregroundColor: Colors.grey[900],
                backgroundColor: Colors.redAccent,
                borderRadius: BorderRadius.circular(12),
              )
            ],
          ),

          child: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(color: Colors.grey[900], borderRadius: BorderRadius.circular(12)),
            child: Row(
              //mainAxisSize: Main
              //AxisSize.min,
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // check box
                Transform.scale(
                  scale: 1.5,
                  child: Checkbox(
                    splashRadius: 50,
                    shape: CircleBorder(),
                    value: TaskDone,
                    onChanged: onChanged,
                    activeColor: Colors.indigoAccent,
                    checkColor: Colors.black,
                  ),
                ),

                // task name
                Expanded(
                  child: Text(
                    taskName,
                    style: TextStyle(color: Colors.white, decoration: TaskDone ? TextDecoration.lineThrough : TextDecoration.none),
                  ),
                ),

                Icon(color: Colors.grey, Icons.keyboard_arrow_right),

                /*
TextButton(
                    onPressed: () {
                      slider = true;
                    },
                    child: Icon(Icons.delete_forever)),

                */

                /*
               ElevatedButton(
                  iconAlignment: IconAlignment.start,
                  onPressed: () {},
                  child: Container(
                    padding: EdgeInsets.only(right: 12),
                    child: Icon(Icons.delete),
                  ),
                ),
               */
              ],
            ),
          ),
        ),
      ),
    );
  }

  /*
 void slideHint() {
    if (slider == true) {
      Slidable(
        enabled: true,
      );
    }
  }
 */
}
