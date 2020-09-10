import 'package:flutter/material.dart';
import 'package:todo_list/screens/PageTemplate.dart';
import 'package:todo_list/widgets/FloatingButton.dart';
import 'package:todo_list/widgets/TaskCard.dart';

import 'TaskPage.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 32.0,
                ),
                child: Image(
                    image: AssetImage(
                        'assets/images/logo.png'
                    )
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    TaskCard(
                      title: "First Task",
                      description: "Hello User! Welcome to WHAT_TODO app, this is a default task that you can edit or delete to start using the app.",
                    ),
                    TaskCard(),
                    TaskCard(),
                    TaskCard(),
                    TaskCard(),
                    TaskCard(),
                    TaskCard(),
                  ],
                ),
              )
            ],
          ),
          FloatingButton(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TaskPage()
                ),
              );
            },
            icon: Image(
                image: AssetImage(
                    "assets/images/add_icon.png"
                )
            ),
            color: Color(0xFF7349FE),
          )
        ],
      )
    );
  }
}
