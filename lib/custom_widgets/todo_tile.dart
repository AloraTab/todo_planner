import 'package:flutter/material.dart';

class TodoTile extends StatefulWidget {
  final String title;
  final String description;

  const TodoTile({Key? key, required this.title, required this.description})
      : super(key: key);

  @override
  State<TodoTile> createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  Color _colorContainer = Colors.black12;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _colorContainer = _colorContainer == Colors.black12 ? Color.fromARGB(255, 212, 230, 192) : Colors.black12;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
        height: 200,
        width: 250,
        color: _colorContainer,
        
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                widget.description,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
