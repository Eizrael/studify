// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CourseTextfield extends StatefulWidget {
  const CourseTextfield({
    super.key,
    required this.label,
    required this.courseNameHintText,
    required this.courseNameController,
    required this.onCourseSelected

  });

  final String label;
  final String courseNameHintText;
  final TextEditingController courseNameController;
  final Function(String, String) onCourseSelected;

  @override
  State<CourseTextfield> createState() => _CourseTextfieldState();
}

class _CourseTextfieldState extends State<CourseTextfield> {
  Map<String, String?> selectedValues = {}; 
  String? selectedCategory;

  List<String> courseCategories = [
    'Science', 'Mathematics', 'Engineering', 'Humanities',
    'Social sciences', 'Business & manag', 'Health & medicines',
    'Tech & computer', 'Arts & design'
  ];

  Map<String, List<String>> categoryItems = {
    'Science': ['Physics', 'Chemistry', 'Biology', 'Astronomy'],
    'Mathematics': ['Algebra', 'Calculus', 'Statistics', 'Geometry'],
    'Engineering': ['Mechanical', 'Electrical', 'Civil', 'Computer'],
    'Humanities': ['Philosophy', 'History', 'Literature', 'Linguistics'],
    'Social sciences': ['Psychology', 'Economics', 'Political Science'],
    'Business & manag': ['Marketing', 'Finance', 'Entrepreneurship'],
    'Health & medicines': ['Anatomy', 'Pharmacology', 'Nursing'],
    'Tech & computer': ['Programming', 'AI', 'Cybersecurity'],
    'Arts & design': ['Painting', 'Sculpture', 'Graphic Design'],
  };

  @override
  void initState() {
    super.initState();
    for (var category in courseCategories) {
       selectedValues[category] = null;
     }
  }

  List<String> getItemsForCategory(String category) {
    return categoryItems[category] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.label, style: TextStyle(fontSize: 17)),

          TextField(
            controller: widget.courseNameController,
            style: TextStyle(fontSize: 14),
            decoration: InputDecoration(
              hintText: widget.courseNameHintText,
              filled: true,
              fillColor: Color(0xFFE8E8E8),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
            ),
          ),
          SizedBox(height: 10),

          Text('Category',
            style: TextStyle(
              fontSize: 17,
              color: Colors.black
            )
          ),

          Container(
            height: 50,
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Color(0xFFE8E8E8),
              borderRadius: BorderRadius.circular(12)
            ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: courseCategories.length,
              itemBuilder: (context, index) {
                String category = courseCategories[index];
                bool isSelected = selectedCategory == category;

                return Padding(
                  padding: EdgeInsets.only(right: 5),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: isSelected ? Color(0xFF817FF3): Colors.white,
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: DropdownButton<String>(
                      hint: Text(
                        category,
                        style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black
                      ),),
                      value: selectedValues[category], 
                      isExpanded: false,
                      underline: SizedBox(),
                      items: getItemsForCategory(category).map((String item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(item, style: TextStyle(color: isSelected ? Colors.white : Colors.black),),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedValues[category] = newValue;
                          selectedCategory = category;

                          if (newValue != null) {
                            widget.onCourseSelected(newValue, widget.courseNameController.text);
                          }

                          // Map<String, String> chosenCourses = Map.from(selectedValues)
                          //   // ignore: unnecessary_null_comparison
                          //   ..removeWhere((key, value) => value == null);
                          // chosenCourses[category];
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
