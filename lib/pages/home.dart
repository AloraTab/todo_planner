import 'package:building_layouts/custom_widgets/todo_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:building_layouts/custom_widgets/horizontal_day_list.dart';
import 'package:building_layouts/custom_widgets/todo_info_popup.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  List<String> dayDependentTodos = [];
  List<String> todoInfo = [
    "mon, study, math test soon",
    "mon, clean, should wipe dust off",
    "wed, workout, day 2/28",
    "tue, groceries, need to get fruits"
  ];
  String weekday = "mon";

  void updateList() {
    dayDependentTodos.clear();
    for (int i = 0; i < todoInfo.length; i++) {
      if (todoInfo[i].split(",")[0] == weekday) {
        dayDependentTodos.add(todoInfo[i]);
      }
    }
  }

  void showInSnackBar(String value) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
      value,
      style: const TextStyle(
          fontWeight: FontWeight.bold, fontSize: 20, color: Colors.redAccent),
    )));
  }

  void changeWeekday(String newDay) {
    setState(() {
      weekday = newDay;
    });

    updateList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
        elevation: 0.0,
        title: const Text("my to-do list"),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          HorizontalDayList(
            dayUpdateFunction: changeWeekday,
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 227, 192, 224),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  boxShadow: [BoxShadow(blurRadius: 10.0)]),
              child: TodoGridView(todoList: dayDependentTodos),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder: (context){
            return TodoInfoPopup(titleController: titleController, descriptionController : descriptionController,);
          }
          ).then((value) {
            setState(() {
              if(descriptionController.text == "" || titleController.text ==""){
                showInSnackBar("Title or description shouldn't be empty :(");
              } else {
                todoInfo.add("$weekday, ${titleController.text}, ${descriptionController.text}");
                updateList();
                titleController.clear();
                descriptionController.clear();
              }
            });
          });
        },
        splashColor: Colors.pink,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        backgroundColor: Colors.pinkAccent,
        child: const Icon(
          Icons.add,
          size: 50,
        ),
      ),
    );
  }
}
