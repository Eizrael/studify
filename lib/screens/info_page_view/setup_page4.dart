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
        height: 250,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12))
              ),
              height: 200,
              child: CupertinoPicker(
                itemExtent: 40,
                scrollController: FixedExtentScrollController(initialItem: selectedIndex),
                onSelectedItemChanged: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                  Navigator.pop(context);
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

/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DayPickerScreen(),
    );
  }
}

class DayPickerScreen extends StatefulWidget {
  @override
  _DayPickerScreenState createState() => _DayPickerScreenState();
}

class _DayPickerScreenState extends State<DayPickerScreen> {
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
        height: 250,
        color: Colors.white,
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
                children: daysOfWeek.map((day) => Center(child: Text(day, style: TextStyle(fontSize: 18)))).toList(),
              ),
            ),
            CupertinoButton(
              child: Text("Done"),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cupertino Day Picker")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Selected Day: ${daysOfWeek[selectedIndex]}",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            CupertinoButton.filled(
              child: Text("Pick a Day"),
              onPressed: () => _showDayPicker(context),
            ),
          ],
        ),
      ),
    );
  }
}
 */