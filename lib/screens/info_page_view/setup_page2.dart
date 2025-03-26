import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:studify/components/loading_button.dart';
import 'package:studify/providers/course_count.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:studify/screens/info_page_view/setup_page3.dart';
import 'package:studify/screens/info_page_view/setup_page4.dart';
import 'package:studify/components/custom_snackbar.dart';

class SetupPage2 extends ConsumerStatefulWidget {
  const SetupPage2({super.key});

  @override
  ConsumerState<SetupPage2> createState() => _SetupPage2State();
}

class _SetupPage2State extends ConsumerState<SetupPage2> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    final count = ref.watch(countProvider);
    

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            if (_controller.page! > 0) {
              _controller.previousPage(
                duration: Duration(milliseconds: 200),
                curve: Curves.easeInOut
              );
            }
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded)
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(15),
              ),
              child: SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: ScaleEffect(
                  dotColor: Colors.white,
                  dotHeight: 10,
                  dotWidth: 10,
                  activeDotColor: Colors.blue
                )
              ),
            ),
          )
        ],
      ),
      body: PageView(
        controller: _controller,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment(0, -0.6),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    'How many courses do you offer?',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
          
              Align(
                alignment: Alignment(0, -0.1),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 12,
                  children: [
                    IconButton(
                      onPressed: () {
                        ref.read(countProvider.notifier).decrease();
                      },
                      icon: Icon(CupertinoIcons.minus, size: 35),
                    ),
                    Text(
                      count.toString(),
                      style: TextStyle(fontSize: 50),
                    ),
                    IconButton(
                      onPressed: () {
                        ref.read(countProvider.notifier).increase();
                         _controller.nextPage(duration: Duration(milliseconds: 200), curve: Curves.elasticIn);
                      },
                      icon: Icon(FluentIcons.add_24_regular, size: 35),
                    ),
                  ],
                ),
              ),
          
              Align(
                alignment: Alignment(0, 0.8),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: LoadingButton(
                    textButton: 'Next',
                    onPressed: () async{
                      await Future.delayed(Duration(seconds: 2));
                      if (count <= 1) {
                        // ignore: use_build_context_synchronously
                        CustomSnackBar.show(context: context, message: 'Pls increase the number of course offered');
                      }else{
                        _controller.nextPage(
                          duration: Duration(milliseconds: 200), curve: Curves.easeIn
                        );
                      }
                      
                    },
                  )
                  
                )
              )
            ],
          ),

          SetupPage3(),
          SetupPage4(),
        ],
      ),
    );
  }
}