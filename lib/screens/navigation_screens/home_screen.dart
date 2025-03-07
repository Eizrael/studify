import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studify/components/subject_container.dart';


class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //int courseCount = ref.watch(countProvider);
    return SafeArea(
      

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        //intro (user name, user-img, (navigation drawer))
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              spacing: 10,
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container (
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Image(image: AssetImage('asset/avatar.png'),)
                ),
                
                Text(
                  'Hi, Israel!',
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'satoshi-black'
                  ),
                ),
                //user img
              ],
            ),
          ),

          //main body
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text (
                  'Courses',
                  style: TextStyle (
                    fontFamily: 'satoshi-bold',
                    fontSize: 20
                  )
                ),

                Text(
                  'your running subjects',
                  style: TextStyle (
                    fontSize: 18,
                    color: Colors.grey
                  ),
                ),

                SizedBox(height: 30,),
                SizedBox(
                  height: 110,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      SubjectContainer(courseName: "MTS 101"),
                      SubjectContainer(courseName: "GNS 101"),
                      SubjectContainer(courseName: "GNS 101"),
                    ],
                  ),
                ),

                SizedBox(height: 30,),
                Text (
                  'Your schedule',
                  style: TextStyle (
                    fontFamily: 'satoshi-bold',
                    fontSize: 20
                  )
                ),

                Text(
                  'Upcomming classes and assignments',
                  style: TextStyle (
                    fontSize: 18,
                    color: Colors.grey
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}