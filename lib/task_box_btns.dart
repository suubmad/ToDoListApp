import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TaskBoxBtns extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  TaskBoxBtns({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  State<TaskBoxBtns> createState() => _TaskBoxBtnsState();
}

class _TaskBoxBtnsState extends State<TaskBoxBtns> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      focusColor: Colors.red,
      color: Colors.blue,
      textColor: Colors.white,
      onPressed: widget.onPressed,
      child: Text(widget.text),
    );
  }
}
