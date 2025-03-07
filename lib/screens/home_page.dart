import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studify/components/custom_icon_btn.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:studify/screens/navigation_screens/calendar.dart';
import 'package:studify/screens/navigation_screens/home_screen.dart';
import 'package:studify/screens/navigation_screens/stats.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int _selectedIndex = 0;
  final ImagePicker _picker = ImagePicker();
  File? _image;

  Future<void> _pickImage(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    } else {
    }
  }
  
  final List<Widget> _pages = [
    HomeScreen(),
    CalendarScreen(),
    StatsScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: _pages[_selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(30.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            height: 65,
            color: Color(0xFFFFFFFF),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomIconBtn(
                  iconName: FluentIcons.home_20_filled,
                  isSelected: _selectedIndex == 0,
                  onPressed: () => _onItemTapped(0),
                ),
                CustomIconBtn(
                  iconName: FluentIcons.calendar_rtl_20_filled,
                  isSelected: _selectedIndex == 1,
                  onPressed: () => _onItemTapped(1),
                ),
                CustomIconBtn(
                  iconName: FluentIcons.person_20_filled,
                  isSelected: _selectedIndex == 2,
                  onPressed: () => _onItemTapped(2),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
