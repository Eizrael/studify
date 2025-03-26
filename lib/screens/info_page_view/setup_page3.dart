import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studify/components/course_textfield.dart';
import 'package:studify/providers/course_count.dart';
import 'package:studify/providers/course_info.dart';
import 'package:studify/components/custom_snackbar.dart';

class SetupPage3 extends ConsumerStatefulWidget {
  const SetupPage3({super.key});

  @override
  ConsumerState<SetupPage3> createState() => _SetupPage3State();
}

class _SetupPage3State extends ConsumerState<SetupPage3> {
  List<TextEditingController> courseNameControllers = [];

  @override
  Widget build(BuildContext context, ) {
    final courseInfo = ref.watch(courseInfoProvider);
    final courseCount = ref.watch(countProvider);

    void updateCourseData(String category, String courseName) {
      ref.read(courseInfoProvider.notifier).addCourseInfo(category, courseName);
    }

    void validateCourse () {
      if (courseNameControllers.length != courseCount) {
        courseNameControllers = List.generate(courseCount, (index) => TextEditingController());

      }
      courseNameControllers.map((controller) => controller.text,).toList();

      for (int i = 0; i < courseCount; i++) {
        String courseName = courseNameControllers[i].text.trim();
        if (courseNameControllers[i].text.trim().isEmpty) {
          CustomSnackBar.show(context: context, message: 'Please enter all course names.');
        }else {
          // courseData[courseName] = courseTitle;
        }
      }
    }

    return SingleChildScrollView(
      child: Container(
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
      
              // SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.62,
              //   child: ListView.builder(
              //     itemCount: courseCount,
              //     itemBuilder: (context, index) {
              //       return Padding(
              //         padding: const EdgeInsets.symmetric(vertical: 8.0),
              //         child: CourseTextfield(
              //           label: 'Course ${index + 1}',
              //           courseNameHintText: 'Course name ${index + 1}',
              //           courseNameController: courseNameControllers[index],
              //           onCourseSelected: updateCourseData,
              //         ),
              //       );
              //     },
              //   ),
              // ),
              //SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}


/*
class _SetupPage3State extends ConsumerState<SetupPage3> {
  List<TextEditingController> courseNameControllers = [];

  @override
  Widget build(BuildContext context) {
    final courseInfo = ref.watch(courseInfoProvider);
    final courseCount = ref.watch(countProvider);

    void updateCourseData(String category, String courseName) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(courseInfoProvider.notifier).addCourseInfo(category, courseName);
      });
    }

    if (courseNameControllers.length != courseCount) {
      courseNameControllers = List.generate(courseCount, (index) => TextEditingController());
    }

    void validateCourses() {
      for (int i = 0; i < courseCount; i++) {
        if (courseNameControllers[i].text.trim().isEmpty) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            CustomSnackBar.show(context: context, message: 'Please enter all course names.');
          });
          return;
        }
      }
    }

    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 70),
              const Text(
                'Enter your course name and course title',
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.62,
                child: ListView.builder(
                  itemCount: courseCount,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: CourseTextfield(
                        label: 'Course ${index + 1}',
                        courseNameHintText: 'Course name ${index + 1}',
                        courseNameController: courseNameControllers[index],
                        onCourseSelected: updateCourseData,
                      ),
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: validateCourses,
                child: const Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
 */