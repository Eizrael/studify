import 'package:flutter/material.dart';

class AssignmentContainer extends StatelessWidget {
  const AssignmentContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration (
        borderRadius: BorderRadius.circular(12),
        color: Colors.purple[250]
      ),
      child: Column (
        spacing: 10,
        children: [
          Text(
            'MTS 103',
            style: TextStyle(
              fontFamily: 'apple-bold-font',
              fontSize: 20,
            ),
          ),

          Text(
            'work on matrix',
            style: TextStyle(
              fontFamily: 'apple-font',
              fontSize: 18,
            ),
          )
        ],
      )
    );
  }
}