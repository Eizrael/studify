import 'package:flutter/material.dart';
import 'package:studify/components/course_info.dart';
// import 'package:studify/components/course_info.dart';

class SetupPage4 extends StatelessWidget {
  const SetupPage4({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 70,),
            Text (
              'Enter your course schedule time',
              style: TextStyle(fontSize: 24),
            ),

            SizedBox(height: 16),
          ],
        ),
      )
    );
  }
}