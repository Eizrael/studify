import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studify/components/course_textfield.dart';
import 'package:studify/providers/num_selected.dart';

class SetupPage3 extends ConsumerStatefulWidget {
  const SetupPage3({super.key});

  @override
  ConsumerState<SetupPage3> createState() => _SetupPage3State();
}

class _SetupPage3State extends ConsumerState<SetupPage3> {
  List<TextEditingController> courseNameControllers = [];
  List<TextEditingController> courseTitleControllers = [];
  Map <String, String> courseData = {};

  @override
  Widget build(BuildContext context) {
    final courseCount = ref.watch(countProvider);

    // Ensure controllers list has the correct number of items
    if (courseNameControllers.length != courseCount) {
      courseNameControllers = List.generate(courseCount, (index) => TextEditingController());
      courseTitleControllers = List.generate(courseCount, (index) => TextEditingController());
    }
    courseNameControllers.map((controller) => controller.text,).toList();
    courseTitleControllers.map((controller) => controller.text,).toList();

    for (int i = 0; i < courseCount; i++) {
      String courseName = courseNameControllers[i].text.trim();
      String courseTitle = courseTitleControllers[i].text.trim();

      if (courseNameControllers[i].text.trim().isEmpty && courseTitleControllers[i].text.trim().isEmpty) {
        print('cant be empyt');
      }else {
        courseData[courseName] = courseTitle;
      }
    }

    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 70,),
            Text(
              'Enter your course name and course title',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.62,
              child: ListView.builder(
                itemCount: courseCount,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: CourseTextfield(
                      label: 'Course ${index + 1}',
                      titleHintText: 'Course name ${index + 1}',
                      courseNameController: courseNameControllers[index],
                      noteHintText: 'Course title ${index + 1}',
                      courseTitleController: courseTitleControllers[index],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
