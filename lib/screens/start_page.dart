import 'package:flutter/material.dart';
import 'package:studify/auth/sign_up_page.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SignUpPage(),
    );
  }
}