import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

class TaskCardWidget extends StatelessWidget {
  final String title;
  final String time;
  final String category;
  final IconData icon;

  const TaskCardWidget({
    super.key,
    required this.title,
    required this.time,
    required this.category,
    required this.icon,

  });


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color(0xFFDEE2FF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Color(0xFFEAECFC),
                  shape: BoxShape.circle
                ),
                child: Center(child: Icon(icon, size: 25, color: Colors.black))
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Color(0xFFEAECFC),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  spacing: 6,
                  children: [
                    Text(
                      category,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Icon(FluentIcons.checkmark_circle_20_filled, size: 16, color: Colors.black),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 18),
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            time,
            style: TextStyle(color: Colors.black54),
          )
        ],
      ),
    );
  }
}