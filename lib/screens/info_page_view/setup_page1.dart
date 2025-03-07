import 'package:flutter/material.dart';

class SetupPage1 extends StatelessWidget {
  const SetupPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, 
          children: [
            SizedBox(height: 150),
            Image.asset ('asset/setup.png', height: 250, width: 250),
            Text (
              "One more before you're in",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'satoshi-black',
                fontSize: 30
              ),
            ),
          ],
        ),
      ),
    );
  }
}