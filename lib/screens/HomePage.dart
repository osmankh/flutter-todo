import 'package:flutter/material.dart';
import 'package:todo_list/helpers/database_helper.dart';
import 'package:todo_list/screens/PageTemplate.dart';
import 'package:todo_list/widgets/FloatingButton.dart';
import 'package:todo_list/widgets/TaskCard.dart';

import 'TaskPage.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  DatabaseHelper _dbHelper = DatabaseHelper();

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
                child: FutureBuilder(
                  initialData: [],
                  future: _dbHelper.getTasks(),
                  builder: (context, snapshot) {
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => TaskPage(
                              task: snapshot.data[index]
                            )));
                          },
                          child: TaskCard(
                            title: snapshot.data[index].title,
                          ),
                        );
                      }
                    );
                  }
                ),
              )
            ],
          ),
          FloatingButton(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TaskPage(task: null,)
                ),
              ).then((value) {
                setState(() {});
              });
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
