import 'package:flutter/material.dart';

class FloatingButton extends StatelessWidget {
  final Function onTap;
  final Image icon;
  final Color color;

  FloatingButton({this.onTap, this.icon, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Positioned(
      bottom: 24.0,
      right: 0.0,
      child: GestureDetector(
        onTap: onTap ?? null,
        child: Container(
          width: 60.0,
          height: 60.0,
          decoration: BoxDecoration(
            color: color ?? null,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: icon ?? null,
        ),
      ),
    ));
  }
}
