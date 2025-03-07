// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomFilledButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback ? onPressed;
  const CustomFilledButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: Color(0xFF8085FD),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        ),
        minimumSize: Size(400, 52)
      ),
      child: Text(
        buttonText,
        style: TextStyle(
          color: Color(0xFFFFFFFF),
          fontSize: 18,
          fontFamily: 'satoshi-bold'
        ),
      ),
    );
  }
}
