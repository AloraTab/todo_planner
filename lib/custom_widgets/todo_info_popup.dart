import 'package:flutter/material.dart';

class TodoInfoPopup extends StatefulWidget {
  final TextEditingController descriptionController;
  final TextEditingController titleController;

  const TodoInfoPopup(
      {super.key,
      required this.descriptionController,
      required this.titleController});

  @override
  State<TodoInfoPopup> createState() => _TodoInfoPopupState();
}

class _TodoInfoPopupState extends State<TodoInfoPopup> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: Colors.pinkAccent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 20,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text(
                "new to-do",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 35),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: TextField(
                  controller: widget.titleController,
                  decoration: const InputDecoration(
                    labelStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    labelText: "Title",
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: TextField(
                  controller: widget.descriptionController,
                  decoration: const InputDecoration(
                    labelStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    labelText: "Description",
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(220, 125, 0, 79),
                    textStyle: const TextStyle(fontWeight: FontWeight.bold)),
                child: const Text("ADD"),
                onPressed: () => Navigator.pop(context, false),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ));
  }
}
