import 'package:flutter/material.dart';
import 'package:todo_list/screens/TaskPage.dart';

class FloatingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Positioned(
        bottom: 24.0,
        right: 0.0,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TaskPage()
                ),
            );
          },
          child: Container(
            width: 60.0,
            height: 60.0,
            decoration: BoxDecoration(
              color: Color(0xFF7349FE),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Image(
                image: AssetImage(
                    "assets/images/add_icon.png"
                )
            ),
          ),
        ),
      )
    );
  }
}
