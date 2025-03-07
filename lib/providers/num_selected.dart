import 'package:flutter_riverpod/flutter_riverpod.dart';

class CourseCountNotifier extends StateNotifier <int> {
  CourseCountNotifier() : super(1);

  void increase () {
    state++;
  }

  void decrease () {
    state--;
  }
}

// class CourseNotifier extends StateNotifier<Map<String, String>> {
//   CourseNotifier() : super({});

//   void updateCourses(List<TextEditingController> titles, List<TextEditingController> notes) {
//     Map<String, String> updatedCourses = {};

//     for (int i = 0; i < titles.length; i++) {
//       String title = titles[i].text.trim();
//       String note = notes[i].text.trim();

//       if (title.isNotEmpty) {
//         updatedCourses[title] = note;
//       }
//     }

//     state = updatedCourses; // Update state with new data
//   }
// }


// // Create a provider for the course data
// final courseProvider = StateNotifierProvider<CourseNotifier, Map<String, String>>(
//   (ref) => CourseNotifier(),
// );

final countProvider = StateNotifierProvider<CourseCountNotifier, int>((ref) => CourseCountNotifier());

final courseInfoProvider = StateProvider<Map?>((ref) => {});


/* 
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CourseNotifier extends StateNotifier<Map<String, String>> {
  CourseNotifier() : super({});

  void updateCourses(List<TextEditingController> titles, List<TextEditingController> notes) {
    Map<String, String> updatedCourses = {};

    for (int i = 0; i < titles.length; i++) {
      String title = titles[i].text.trim();
      String note = notes[i].text.trim();

      if (title.isNotEmpty) {
        updatedCourses[title] = note;
      }
    }

    state = updatedCourses; // Update state with new data
  }
}

// Create a provider for the course data
final courseProvider = StateNotifierProvider<CourseNotifier, Map<String, String>>(
  (ref) => CourseNotifier(),
);

void saveToProvider(BuildContext context, WidgetRef ref) {
  ref.read(courseProvider.notifier).updateCourses(titleControllers, noteControllers);
}
*/
