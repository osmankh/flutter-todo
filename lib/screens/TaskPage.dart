import 'package:flutter/material.dart';
import 'package:todo_list/helpers/database_helper.dart';
import 'package:todo_list/models/Task.dart';
import 'package:todo_list/models/Todo.dart';
import 'package:todo_list/screens/PageTemplate.dart';
import 'package:todo_list/widgets/CustomBackButton.dart';
import 'package:todo_list/widgets/CustomCheckBox.dart';
import 'package:todo_list/widgets/FloatingButton.dart';

class TaskPage extends StatefulWidget {
  Task task;

  TaskPage({@required this.task});

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  DatabaseHelper _dbHelper = DatabaseHelper();
  final todoInputController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      child: Stack(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Row(
                children: [
                  CustomBackButton(),
                  Expanded(
                      child: TextField(
                    controller: TextEditingController(
                        text: widget.task != null ? widget.task.title : ""),
                    onSubmitted: (value) async {
                      if (value != "") {
                        await DatabaseHelper().insertTask(Task(title: value));
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "Enter Task Title...",
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF211551)),
                  ))
                ],
              ),
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: "Enter Description for the task...",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(bottom: 32)),
            ),
            Expanded(
              child: FutureBuilder(
                  initialData: [],
                  future: _dbHelper.getTodos(widget.task),
                  builder: (context, snapshot) {
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return CustomCheckBox(
                            id: snapshot.data[index].id,
                            label: snapshot.data[index].label,
                            checked: 0,
                            task_id: widget.task.id,
                          );
                        });
                  }),
            ),
            Row(
              children: [
                Container(
                  width: 20.0,
                  height: 20.0,
                  margin: EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      border: Border.all(
                          width: 1.5,
                          color: Color(0xFF86829D)
                      )
                  ),
                  child: Image(
                    image: AssetImage(
                        "assets/images/check_icon.png"
                    ),
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: todoInputController,
                    onSubmitted: (value) async {
                      if (value != "") {
                        Task task = widget.task;
                        if (task == null) {
                          task = Task();
                          DatabaseHelper().insertTask(Task()).then((value) => task.id = value);
                          widget.task = task;
                          setState(() {});
                        }

                        Todo todo = Todo(label: value, task_id: task.id);

                        await DatabaseHelper().insertTodo(todo);
                        todoInputController.clear();
                        setState(() {});
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "Enter new TODO...",
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                        color: Color(0xFF86829D)),
                  ),
                ),
              ],
            )
          ],
        ),
        FloatingButton(
          icon: Image(image: AssetImage("assets/images/delete_icon.png")),
          color: Color(0xFFFE3577),
        )
      ]),
    );
  }
}
