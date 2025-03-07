// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CourseTextfield extends StatelessWidget {
  const CourseTextfield({
    Key? key,
    required this.label,
    required this.titleHintText,
    required this.courseNameController,
    required this.courseTitleController,
    required this.noteHintText,
  }) : super(key: key);

  final String label;
  final String titleHintText;
  final String noteHintText;
  final TextEditingController courseNameController;
  final TextEditingController courseTitleController;



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 17
            ),
          ),
      
          TextField(
            controller: courseNameController,
            style: const TextStyle(
              fontSize: 14,
            ),
            decoration: InputDecoration(
              hintStyle: const TextStyle(
                color: Color(0xFFB0B0B0),
                fontSize: 13,
              ),
              hintText: titleHintText,
              filled: true,
              fillColor: Color(0xFFE8E8E8),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            )
          ),
          SizedBox(height: 10,),
          
          TextField(
            controller: courseTitleController,
            keyboardType: TextInputType.multiline,
            maxLines: null, 
            minLines: 2,
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
              hintText: noteHintText,
              filled: true,
              fillColor: const Color(0xFFE8E8E8),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
