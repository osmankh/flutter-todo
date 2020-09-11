import 'package:flutter/material.dart';
import 'package:todo_list/helpers/database_helper.dart';
import 'package:todo_list/models/Todo.dart';

class CustomCheckBox extends StatefulWidget {
  final int id;
  final String label;
  int checked;
  final int task_id;

  CustomCheckBox({
    this.id,
    this.label,
    this.checked,
    this.task_id
  });

  @override
  _CustomCheckBoxState createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  DatabaseHelper _dbHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: GestureDetector(
        onTap: () {
          Todo todo = Todo(id: widget.id, label: widget.label, checked: widget.checked == 0 ? 1 : 0, task_id: widget.task_id);
          _dbHelper.updateTodo(todo);

          setState(() {
            widget.checked = todo.checked;
          });
        },
        child: Row(
          children: [
            Container(
              width: 20.0,
              height: 20.0,
              margin: EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                  color: widget.checked != 0 ? Color(0xFF7349FE) : Colors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  border: widget.checked != 0 ? null : Border.all(
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
            Text(
              widget.label ?? "(Untitled)",
              style: TextStyle(
                  color: widget.checked != 0 ? Color(0xFF211551) : Color(0xFF86829D),
                  fontSize: 16,
                  fontWeight: widget.checked != 0 ? FontWeight.bold : FontWeight.normal
              ),
            )
          ],
        ),
      ),
    );
  }
}
