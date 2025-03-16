
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CourseInfoNotifier extends StateNotifier<Map<String, String>> {
  CourseInfoNotifier() : super({});

  void addCourseInfo(String category, String course) {
    state = {...state, category: course}; // Updating state properly
  }
}

final courseInfoProvider = StateNotifierProvider<CourseInfoNotifier, Map<String, String>>(
  (ref) => CourseInfoNotifier(),
);
