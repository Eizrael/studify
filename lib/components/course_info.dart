// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CourseInfo extends ConsumerWidget {
  final String courseName;
  final String dayPickerText;
  final String startTimeText;
  final String endTimeText;
  final VoidCallback dayPicker;
  final VoidCallback startTime;
  final VoidCallback endTime;

  const CourseInfo({super.key, 
    required this.courseName,
    this.dayPickerText = 'Monday',
    this.startTimeText = '11:00 AM',
    this.endTimeText = '12:00 PM',
    required this.dayPicker,
    required this.startTime,
    required this.endTime,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        //Course Name
        Text(
          courseName,
          style: TextStyle(
            fontSize: 20,
          ),
        ),

        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color:Color(0xFFE8E8E8),
            borderRadius: BorderRadius.circular(12)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                dayPickerText,
                style: TextStyle(
                  fontSize: 17
                ),
              ),
              IconButton(
                onPressed: dayPicker,
                icon: Icon(Icons.keyboard_arrow_down_rounded),
                color: Color(0xFF817FF3),
                iconSize: 35,
              )
            ],
          ),
        ),
        //Row
        Row (
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              spacing: 5,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Start Time',
                  style: TextStyle(
                    fontSize: 15
                  )
                ),
                Container (
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Color(0xFFE8E8E8),
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Row (
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        startTimeText, style:
                        TextStyle(
                          fontSize: 17
                        ),
                      ),
                      IconButton(
                        onPressed: startTime,
                        icon: Icon(Icons.keyboard_arrow_down_rounded),
                        color: Color(0xFF817FF3),
                        iconSize: 35,
                      )
                    ],
                  )
                ),
              ],
            ),
        
            Column(
              spacing: 5,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'End Time',
                  style: TextStyle(
                    fontSize: 15
                  )
                ),
                Container (
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Color(0xFFE8E8E8),
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Row (
                    children: [
                      Text(
                        endTimeText, style:
                        TextStyle(
                          fontSize: 17
                        ),
                      ),
                      IconButton(
                        onPressed: endTime,
                        icon: Icon(Icons.keyboard_arrow_down_rounded),
                        color: Color(0xFF817FF3),
                        iconSize: 35,
                      )
                    ],
                  )
                ),
              ],
            ),
          ]
        )
      ],
    );
  }
}
