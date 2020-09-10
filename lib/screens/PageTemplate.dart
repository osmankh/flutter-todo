import 'package:flutter/material.dart';

class PageTemplate extends StatelessWidget {
  final Widget child;
  PageTemplate({this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: 24.0,
            ),
            color: Color(0xFFF6F6F6),
            child: child ?? Center(
                child: Text(
                  "🤭",
                  style: TextStyle(
                    fontSize: 50.0
                  ),
                )
            ),
          ),
        )
    );
  }
}
