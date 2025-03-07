// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class SubjectContainer extends StatelessWidget {

  final String courseName;
  const SubjectContainer({
    super.key,
    required this.courseName,
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Container(
        width: 170,
        height: 50,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.pink,
          borderRadius: BorderRadius.circular(13)
        ),
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Course icon
            SvgPicture.asset('asset/calculating.svg', height: 40, width: 40,colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),),
      
            //course name
            Text(
              courseName,
              style: TextStyle(
                fontSize: 15,
                color: Colors.white
              ),
            )
          ],
        ),
      ),
    );
  }
}
