import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:studify/components/custom_filled_button.dart';
import 'package:studify/components/custom_snackbar.dart';
import 'package:studify/components/custom_text_field.dart';

class ForgotPwd extends StatefulWidget {
  const ForgotPwd({super.key});

  @override
  State<ForgotPwd> createState() => _ForgotPwdState();
}

class _ForgotPwdState extends State<ForgotPwd> {
  final  TextEditingController _emailController = TextEditingController();

  @override
  void dispose () {
    _emailController.dispose();
    super.dispose();
  }

  Future _resetPassword (BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(color: Color(0xFF000000)),
        );
      }
    );
    // ignore: no_leading_underscores_for_local_identifiers
    void _showSnackBar(String message) {
      CustomSnackBar.show(
        context: context,
        message: message,
      );
    }

    if (_emailController.text.trim().isEmpty) {
      _showSnackBar('Your email is required');
      if (context.mounted) {
        Navigator.of(context).pop();
      }
      return;
    }

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailController.text.trim());
    }on FirebaseAuthException catch (e) {
      _showSnackBar(e.toString());
      if (context.mounted) {
        Navigator.of(context).pop();
      }
    }
    if (context.mounted) {
      Navigator.of(context).pop();
    }
    _showSnackBar('Check your email to reset your password');
    _emailController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFFD6D6D6),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/loginPage');
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 23,
                            color: Color(0xFF080C0A),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 50),
                  ],
                ),

                SizedBox(height: 60,),
            
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 10,
                    children: [
                      Text(
                        'Reset\nyour Password',
                        style: TextStyle(
                            fontSize: 28,
                            fontFamily: 'main-font'
                          ),
                      ),
                      //email tetxfield
                      CustomTextField(fieldLabel: '', hintText: 'Email', controller: _emailController),
            
                      //summit button
                      SizedBox(height: 5,),
                      CustomFilledButton(onPressed: () => _resetPassword(context), buttonText: 'Reset')
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}