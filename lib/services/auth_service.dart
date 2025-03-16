import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:studify/components/custom_snackbar.dart';
// import 'package:studify/screens/home_page.dart';
import 'dart:async';

import 'package:studify/screens/info_page_view/setup_page1.dart'; 

class AuthService {
  Future<void> signup({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    String message = '';
    bool isSignupSuccessful = false;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(color: Color(0xFF000000)),
        );
      },
    );

    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;
      if (user != null) {
        await user.updateDisplayName(name);
        await user.reload();
      }

      message = 'Signup successful!';
      isSignupSuccessful = true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'An account already exists with that email.';
      } else {
        message = 'Error: ${e.message}';
      }
    } catch (e) {
      message = 'An unexpected error occurred: ${e.toString()}';
    } finally {
      if (context.mounted) {
        Navigator.of(context).pop(); 
      }
    }

    if (context.mounted) {
      CustomSnackBar.show(
        context: context,
        message: message,
      );

      if (isSignupSuccessful) {
        await Future.delayed(const Duration(seconds: 2));
        if (context.mounted) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              // builder: (context) => HomePage(),
              builder: (context) => SetupPage1(), 
            ),
            (route) => false,
          );
        }
      }
    }
  }

  Future<void> login({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    String message = '';
    bool isLoginSuccessful = false;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(color: Color(0xFF000000)),
        );
      },
    );

    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      message = 'Login successful! Welcome back, ${userCredential.user?.displayName ?? 'User'}.';
      isLoginSuccessful = true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        message = 'No user found with this email.';
      } else if (e.code == 'wrong-password') {
        message = 'Incorrect password.';
      } else {
        message = 'Error: ${e.message}';
      }
    } catch (e) {
      message = 'An unexpected error occurred: ${e.toString()}';
    } finally {
      if (context.mounted) {
        Navigator.of(context).pop(); 
      }
    }

    if (context.mounted) {
      CustomSnackBar.show(
        context: context,
        message: message,
      );

      if (isLoginSuccessful) {
        await Future.delayed(const Duration(seconds: 2));

        if (context.mounted) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              // builder: (context) => HomePage(), 
              builder: (context) => SetupPage1(), 
            ),
            (route) => false, 
          );
        }
      }
    }
  }
}
