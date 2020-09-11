import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Padding(
          padding: const EdgeInsets.only(
            right: 24
          ),
          child: Image(
              image: AssetImage(
                  'assets/images/back_arrow_icon.png'
              )
          ),
        ),
      )
    );
  }
}
