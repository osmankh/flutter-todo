import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  final String label;
  final bool checked;
  CustomCheckBox({
    this.label,
    this.checked
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Container(
            width: 20.0,
            height: 20.0,
            margin: EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              color: checked ? Color(0xFF7349FE) : Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(6)),
              border: checked ? null : Border.all(
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
            label ?? "(Untitled)",
            style: TextStyle(
              color: checked ? Color(0xFF211551) : Color(0xFF86829D),
              fontSize: 16,
              fontWeight: checked ? FontWeight.bold : FontWeight.normal
            ),
          )
        ],
      ),
    );
  }
}
