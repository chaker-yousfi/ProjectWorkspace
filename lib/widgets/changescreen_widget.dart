import 'package:flutter/material.dart';

class ChangeScreen extends StatelessWidget {
  final String whichAccount;
  final VoidCallback onTap;
  final String name;

  // Use required for non-nullable parameters
  ChangeScreen(
      {required this.name, required this.onTap, required this.whichAccount});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(whichAccount),
        SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            name,
            style: TextStyle(
              color: Colors.cyan,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}
