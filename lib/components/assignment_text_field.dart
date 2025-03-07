import 'package:flutter/material.dart';

class AssignmentTextField extends StatefulWidget {
  final String fieldLabel;
  final String hintText;
  final TextEditingController controller;

  const AssignmentTextField({
    super.key,
    required this.fieldLabel,
    required this.hintText,
    required this.controller,
  });

  @override
  State<AssignmentTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<AssignmentTextField> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.fieldLabel,
          style: const TextStyle(
            fontSize: 17,
            fontFamily: 'apple-bold-font',
          ),
        ),
        const SizedBox(height: 3),
        TextField(
          controller: widget.controller,
          style: const TextStyle(
            fontSize: 17,
            fontFamily: 'apple-font',
          ),
          decoration: InputDecoration(
            hintStyle: const TextStyle(
              color: Color(0xFFB0B0B0),
              fontFamily: 'apple-font',
              fontSize: 15,
            ),
            hintText: widget.hintText,
            filled: true,
            fillColor:Color(0xFFE8E8E8),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
