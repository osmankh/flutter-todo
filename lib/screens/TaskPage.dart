import 'package:flutter/material.dart';
import 'package:todo_list/screens/PageTemplate.dart';
import 'package:todo_list/widgets/CustomBackButton.dart';
import 'package:todo_list/widgets/CustomCheckBox.dart';
import 'package:todo_list/widgets/FloatingButton.dart';

class TaskPage extends StatefulWidget {
  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
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
            CustomCheckBox(label: "Create your first task", checked: true),
            CustomCheckBox(
                label: "Create your first todo as well", checked: false),
            CustomCheckBox(label: "Stay Safe!", checked: false),
          ],
        ),
        FloatingButton(
          icon: Image(
              image: AssetImage(
                  "assets/images/delete_icon.png"
              )
          ),
          color: Color(0xFFFE3577),
        )
      ]),
    );
  }
}
