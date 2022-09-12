import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:building_layouts/pages/home.dart';


void main(){
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key); //Why this over super : key?

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner:   false,
      home: HomePage(),
    );
  }
}