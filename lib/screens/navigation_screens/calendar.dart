import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
class CalendarScreen extends ConsumerWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Text('Calendar', style: TextStyle(
              fontSize: 20,
              color: Colors.grey
            ),),
          ),
      
          SizedBox(height: 10,),
          //calendar icon
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              // color: Colors.red,
              border: Border.all(
                color: Colors.grey
              ),
              borderRadius: BorderRadius.circular(13)
            ),
            child: Icon(
              FluentIcons.calendar_rtl_20_filled,
              color: Color(0xFF6672D5),
              size: 35,
            ),
          ),
      
          //date picker
         
          SizedBox(height: 15),
          Container(
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Color(0xFFF7F7F9),
              borderRadius: BorderRadius.circular(15)
            ),
            child: DatePicker(
              DateTime.now(),
              height: 100,
              width: 75,
              daysCount: 14,
              selectedTextColor: Colors.white,
              selectionColor: Colors.black,
              initialSelectedDate: DateTime.now(),
            ),
          ),

          Expanded(
            child: ListView(),
          )
        ],
      )
    );
  }
}
