import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studify/components/custom_filled_button.dart';
import 'package:studify/components/custom_text_field.dart';
import 'package:studify/components/custom_snackbar.dart';
import 'package:studify/services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends ConsumerWidget {
  LoginPage({super.key});

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  Future<void> _loginUser (BuildContext context) async{
    // ignore: no_leading_underscores_for_local_identifiers
    void _showSnackBar(String message) {
    CustomSnackBar.show(
      context: context,
      message: message,
      );
    }

    String password = _passwordController.text.trim();
    String email = _emailController.text.trim();


    if (password.isEmpty) {
      _showSnackBar('Password field is required');
      return;
    }
    if (email.isEmpty) {
      _showSnackBar('Email field is required');
      return;
    }
    _emailController.clear();
    _passwordController.clear();
    
    final authService = AuthService();
    authService.login(
      context: context,
      email: email,
      password: password,
    );
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isAuthenticated', true);

  }

  Future<void> saveAuthState (bool isLoggedIn) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', isLoggedIn);
  }
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25),
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Arrow_back icon
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
                            // Add navigation logic here
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 23,
                            color: Color(0xFF080C0A),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 50),
                  ],
                ),
        
                // Create account text
                SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Login\nto your Account',
                        style: TextStyle(
                          fontSize: 28,
                          fontFamily: 'poppins-bold'
                        ),
                      ),
                      SizedBox(height: 15,),
                      // Email textfield
                      CustomTextField(fieldLabel: 'Email', hintText: 'tonyatoyosi@gmail.com', controller: _emailController,),
        
                      // password textfield
                      CustomTextField(fieldLabel: 'Password', hintText: 'your password', controller: _passwordController, isPassword: true,),

                      //forgot password
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: 20,),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/forgotpassword');
                            },
                            child: Text(
                              'Forgot password?',
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 16
                              ),
                            ),
                          )
                        ]
                      ),
        
                      //create account Button 
                      SizedBox(height: 10,),
                      Center(child: CustomFilledButton(onPressed: () => _loginUser(context), buttonText: 'Login')),
      
                      //already have an acctount text?
                      SizedBox(height: 10,),
                      Row(
                        spacing: 5,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
                            style: TextStyle(
                              color: Color(0xFFC0C2C8),
                              fontSize: 16
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/signupPage');
                            },
                            child: Text(
                              'Sign up',
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      )
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