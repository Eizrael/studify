import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studify/components/custom_filled_button.dart';
import 'package:studify/components/custom_snackbar.dart';
import 'package:studify/components/custom_text_field.dart';
import 'package:studify/services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpPage extends ConsumerWidget {
  SignUpPage({super.key});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pass1Controller = TextEditingController();
  final TextEditingController _pass2Controller = TextEditingController();

  Future <void> _validateForm(BuildContext context) async{
    String name = _nameController.text.trim();
    String email = _emailController.text.trim();
    String firstPassword = _pass1Controller.text.trim();
    String confirmPassword = _pass2Controller.text.trim();

    String emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.(com|org|net|edu|gov)$';
    final  passwordPattern =  r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[^A-Za-z\d])[A-Za-z\d\S]{6,}$';
    final  nameRegExp = RegExp(r"^[a-zA-Z]+(?: [a-zA-Z]+)+$");

    RegExp emailRegExp = RegExp(emailPattern);
    RegExp passwordRegExp = RegExp(passwordPattern);

    // ignore: no_leading_underscores_for_local_identifiers
    void _showSnackBar(String message) {
      CustomSnackBar.show(
        context: context,
        message: message,
      );
    }

    if (name.isEmpty) {
      _showSnackBar('Full name field is required');
      return;
    }
    if (!nameRegExp.hasMatch(name)) {
      _showSnackBar('Enter a valid full name (e.g., John Doe)');
      return;
    }
    if (email.isEmpty) {
      _showSnackBar('Email field is required');
      return;
    }
    if (!emailRegExp.hasMatch(email)) {
      _showSnackBar('Enter a valid email address');
      return;
    }
    if (firstPassword.isEmpty || confirmPassword.isEmpty) {
      _showSnackBar('Both password fields are required');
      return;
    }
    if (firstPassword != confirmPassword) {
      _showSnackBar('Passwords do not match');
      return;
    }
    if (!passwordRegExp.hasMatch(firstPassword)) {
      _showSnackBar(
        'Password must be at least 6 characters long,contain at least one letter, one number, and one special character.',
      );
      return;
    }
    _nameController.clear();
    _emailController.clear();
    _pass1Controller.clear();
    _pass2Controller.clear();

    final authService = AuthService();
    authService.signup(
      context: context,
      email: email,
      password:firstPassword,
      name: name,
    );
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isAuthenticated', true);
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
                          onPressed: () {},
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
        
                // Create account text
                SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Create\nAccount',
                        style: TextStyle(
                          fontSize: 28,
                          fontFamily: 'poppins-bold'
                        ),
                      ),
                      SizedBox(height: 15,),
        
                      // Full name textfield
                      CustomTextField(fieldLabel: 'Full Name', hintText: 'John Doe', controller: _nameController,),
        
                      // Email textfield
                      CustomTextField(fieldLabel: 'Email', hintText: 'ohndoe@gmail.com', controller: _emailController,),
        
                      // password textfield
                      CustomTextField(fieldLabel: 'Password', hintText: 'password', controller: _pass1Controller, isPassword: true,),
        
                      // Confirm password textfield
                      CustomTextField(fieldLabel: 'Confirm Password', hintText: 'confirm password', controller: _pass2Controller, isPassword: true,),
      
                      //create account Button 
                      SizedBox(height: 10,),
                      Center(child: CustomFilledButton(
                        onPressed:() => _validateForm(context),
                        buttonText: 'Sign up')),
      
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
                              Navigator.pushNamed(context, '/loginPage');
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 16,
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