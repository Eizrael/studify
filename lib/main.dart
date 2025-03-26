// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studify/firebase_options.dart';
import 'package:studify/auth/forgot_pwd.dart';
import 'package:studify/auth/login_page.dart';
import 'package:studify/auth/sign_up_page.dart';
import 'package:studify/screens/assignmentpage.dart';
import 'package:studify/screens/home_page.dart';
import 'package:studify/screens/info_page_view/setup_page1.dart';
import 'package:studify/screens/info_page_view/setup_page2.dart';
import 'package:studify/screens/start_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final prefs = await SharedPreferences.getInstance();
  final isAuthenticated = prefs.getBool('isAuthenticated') ?? false;
  
  runApp(ProviderScope(child: MyApp(isAuthenticated: isAuthenticated)));
}

class MyApp extends StatelessWidget {
  final bool isAuthenticated;
   const MyApp({required this.isAuthenticated});
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'satoshi-medium',
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFFFFFFF)),
        useMaterial3: true,
      ),
      home: isAuthenticated ? SetupPage1() : StartPage(),

      onGenerateRoute: (settings) {
        if (settings.name == '/nextScreen') {
          return PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 900),
            pageBuilder: (context, animation, secondaryAnimation) => SetupPage2(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              var begin = Offset(0.0, -1.0); 
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

      routes: {
        '/loginPage': (context) => LoginPage(),
        '/signupPage': (context) => SignUpPage(),
        '/homepage': (context) => HomePage(),
        '/forgotpassword': (context) => ForgotPwd(),
        '/addasspage': (context) => AddAssignment(),
        '/setuppage1': (context) => SetupPage1(),
        '/setuppage2': (context) => SetupPage2()
      },
    );
  }
}
