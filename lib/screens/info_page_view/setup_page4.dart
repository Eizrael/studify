import 'package:flutter/material.dart';
import 'package:studify/components/course_info.dart';
import 'package:flutter/cupertino.dart';

class SetupPage4 extends StatefulWidget {
  const SetupPage4({super.key});

  @override
  State<SetupPage4> createState() => _SetupPage4State();
}

class _SetupPage4State extends State<SetupPage4> {
  final List<String> daysOfWeek = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
  ];

  int selectedIndex = 0;

  void _showDayPicker(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12))
        ),
        height: 250,
        child: Column(
          children: [
            SizedBox(
              
              height: 200,
              child: CupertinoPicker(
                itemExtent: 40,
                scrollController: FixedExtentScrollController(initialItem: selectedIndex),
                onSelectedItemChanged: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                children: daysOfWeek.map((day) => Center(child: Text(day, style: TextStyle(fontSize: 18, fontFamily: 'satoshi-medium')))).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 70,),
            Text (
              'Enter your course schedule time',
              style: TextStyle(fontSize: 24),
            ),

            SizedBox(height: 16),
            CourseInfo(
              courseName: 'MTS 101',
              dayPickerText: daysOfWeek[selectedIndex],
              startTimeText: '11:00 AM',
              endTimeText: '14:00 PM',
              dayPicker: () => _showDayPicker(context),
              startTime: () {},
              endTime: () {}
            )
          ],
        ),
      )
    );
  }
}