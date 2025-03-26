import 'package:flutter_riverpod/flutter_riverpod.dart';

class CourseCountNotifier extends StateNotifier <int> {
  CourseCountNotifier() : super(1);

  void increase () {
    state++;
  }

  void decrease () {
    if (state != 1) {
      state--;
    }
  }
}


final countProvider = StateNotifierProvider<CourseCountNotifier, int>((ref) => CourseCountNotifier());

