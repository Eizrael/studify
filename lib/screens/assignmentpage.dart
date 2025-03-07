import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studify/components/assignment_text_field.dart';
import 'package:studify/components/custom_filled_button.dart';
import 'package:studify/components/note_text_field.dart';
// import 'package:fluentui_system_icons/fluentui_system_icons.dart';

class AddAssignment extends ConsumerWidget {
    AddAssignment({super.key});
    final TextEditingController _course = TextEditingController();

    @override
    Widget build(BuildContext context, WidgetRef ref) {
        return Scaffold(

          backgroundColor: Color(0xFFFFFFFF),
          body: SafeArea(
            child: Column(
              children: [
                //Add Assignment Text
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        style: IconButton.styleFrom(
                          backgroundColor: Color(0XFFF8F8F8)
                        ),
                        padding: EdgeInsets.all(5),
                        onPressed: () {
                          Navigator.pushNamed(context, '/homepage');
                        },
                        icon: Icon(
                          CupertinoIcons.chevron_back,
                          size: 25,
                        )
                      ),
                      Text(
                        'Add Assignment',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey
                        ),
                      ),

                      SizedBox(width: 20,)
                    ],
                  ),
                ),

                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    spacing: 10,
                    children: [
                      AssignmentTextField(fieldLabel: 'Course Name', hintText: 'eg MTS 101', controller: _course),
                      NoteTextField(fieldLabel: 'Note', hintText: 'short note', controller: _course),
                      
                      SizedBox(height: 15,),
                      CustomFilledButton(onPressed: () {}, buttonText: "Add Assignment")
                    ],
                  ),
                )
              ],
            )
          ),
        );
    }
}