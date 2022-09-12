import 'package:flutter/material.dart';

class TodoDone extends StatefulWidget {
  final Function updateTodoFunction;
  const TodoDone({super.key, required this.updateTodoFunction});

  @override
  State<TodoDone> createState() => _TodoDoneState();
}

class _TodoDoneState extends State<TodoDone> {
  Color completedColor = Color.fromARGB(255, 196, 231, 157);

  void updateTodoFunction(int index) {
    setState(() {
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}