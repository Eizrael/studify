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
import 'package:studify/screens/info_page_view/setup_page.dart';
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
      home: isAuthenticated ? InfoSetup() : StartPage(),

      routes: {
        '/loginPage': (context) => LoginPage(),
        '/signupPage': (context) => SignUpPage(),
        '/homepage': (context) => HomePage(),
        '/forgotpassword': (context) => ForgotPwd(),
        '/addasspage': (context) => AddAssignment(),
        '/infopage': (context) => InfoSetup(),
      },
    );
  }
}
