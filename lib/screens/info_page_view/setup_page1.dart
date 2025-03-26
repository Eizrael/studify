import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class SetupPage1 extends StatelessWidget {
  const SetupPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Align(
            alignment: Alignment(0, -0.45),
            child: Image.asset('asset/setup.png', height: 250)
          ),

          Align(
            alignment: Alignment(0, 0.1),
            child: Text(
              'Welcome to Studify!',
              style: TextStyle(
                fontSize: 33,
                fontFamily: 'satoshi-bold'
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, 0.3),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                "Let's get you set up. Provide a few details to personalise your Studify experience",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18
                ),
              ),
            ),
          ),

          Align(
            alignment: Alignment(0, 0.8),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: FilledButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/setuppage2');
                },
                style: FilledButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(19)
                  ),
                  maximumSize: Size(310, 60)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Continue',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white
                      ),
                    ),
                    Icon(
                      FluentIcons.next_32_filled,
                      color: Colors.white,
                      size: 25,
                    )
                  ],
                )
              ),
            ),
          ),

          //skip button

          Align(
            alignment: Alignment(0, 0.9),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/homepage');
              },
              child: Text(
                'Skip',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 18
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

/*
MaterialApp(
  onGenerateRoute: (settings) {
    if (settings.name == '/nextScreen') {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => NextScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = Offset(-1.0, 0.0); 
          var end = Offset.zero;
          var curve = Curves.easeInOut;

          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(position: offsetAnimation, child: child);
        },
      );
    }
    return null;
  },
);

MaterialApp(
  onGenerateRoute: (settings) {
    if (settings.name == '/nextScreen') {
      return PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 600), // Increase duration
        pageBuilder: (context, animation, secondaryAnimation) => NextScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = Offset(-1.0, 0.0);
          var end = Offset.zero;
          var curve = Curves.easeInOut;

          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(position: offsetAnimation, child: child);
        },
      );
    }
    return null;
  },
);
 */