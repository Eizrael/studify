import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studify/components/svg_buttons.dart';

class CourseInfo extends ConsumerWidget {
  CourseInfo({super.key});

  final List<String> svgPaths = [
    'asset/atom.svg',
    'asset/calculating.svg',
    'asset/chemistry.svg',
    'asset/engineer.svg',
    'asset/engineering.svg',
    'asset/language-learning.svg',
    'asset/finance.svg',
    'asset/maths.svg',
    'asset/medical-team.svg',
    'asset/programmer.svg',
    'asset/stethoscope.svg',
    'asset/worker.svg',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        //Course Name
        Text('MTS 101'),

        //Row
          // start date/time
          // end date/time

        //Svg buttons
        SizedBox(
          height: 60,
          //width: 500,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              ...List.generate(svgPaths.length, (index) {
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SvgButton(svgPath: svgPaths[index], onTap: () {
                            
                  }),
                );
              })
            ],
          ),
        )
        
      ],
    );
  }
}