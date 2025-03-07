import 'package:flutter/material.dart';

class NoteTextField extends StatefulWidget {
  final String fieldLabel;
  final String hintText;
  final TextEditingController controller;

  const NoteTextField({
    super.key,
    required this.fieldLabel,
    required this.hintText,
    required this.controller,
  });

  @override
  State<NoteTextField> createState() => _NoteTextFieldState();
}

class _NoteTextFieldState extends State<NoteTextField> {
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
        SizedBox(height: 3),
        TextField(
          controller: widget.controller,
          keyboardType: TextInputType.multiline,
          maxLines: null, // Allows unlimited lines
          minLines: 1, // Starts with at least 5 lines
          style: const TextStyle(
            fontSize: 17,
          ),
          decoration: InputDecoration(
            hintStyle: const TextStyle(
              color: Color(0xFFB0B0B0),
              fontSize: 15,
            ),
            hintText: widget.hintText,
            filled: true,
            fillColor: const Color(0xFFE8E8E8),
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