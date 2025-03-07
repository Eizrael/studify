import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:studify/components/custom_filled_button.dart';
import 'package:studify/components/custom_snackbar.dart';
import 'package:studify/providers/num_selected.dart';
import 'package:studify/screens/info_page_view/setup_page1.dart';
import 'package:studify/screens/info_page_view/setup_page2.dart';
import 'package:studify/screens/info_page_view/setup_page3.dart';
import 'package:studify/screens/info_page_view/setup_page4.dart';

class InfoSetup extends ConsumerStatefulWidget {
  const InfoSetup({super.key});
  @override
  ConsumerState<InfoSetup> createState() => _InfoSetupState();
}

class _InfoSetupState extends ConsumerState<InfoSetup> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  String textButton = 'Next';

  @override
  void initState() {
    super.initState();
    _pageController.addListener(
      () {
        _currentPage = _pageController.page?.round() ?? 0;
        if (_pageController.page?.round() == 3 ) {
          setState(() {
            textButton = 'Done';
          });
        }else {
          setState(() {
            textButton = 'Next';
          });
        }
      }
    );
    
  }

  void nextPage () {
    final count = ref.watch(countProvider);
  
    if (_pageController.page?.round() == 3 ) {
      Navigator.pushNamedAndRemoveUntil(context, '/homepage', (route) => false);
    }
    if (_pageController.page?.round() == 1 && count == 1) {
      CustomSnackBar.show(context: context, message: 'Please increase the number of course offered');
    }else {
      _pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
    }
    
    
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                SetupPage1(),
                SetupPage2(),
                SetupPage3(),
                SetupPage4()
              ],
            ),
            Positioned(
              top: 20, 
              left: 0,
              right: 0,
              child: Center(
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: 4,
                  effect: WormEffect(
                    activeDotColor: Color(0xFF8085FD),
                    dotColor: Color(0xFFE8E8E8),
                    dotHeight: 5.0,
                    dotWidth: 75.0,
                    radius: 5
                  ),
                ),
              ),
            ),

            Positioned(
              bottom: 70,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: CustomFilledButton(
                  onPressed: nextPage, buttonText: textButton,
                ),
              )
            ),

            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 40, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _currentPage == 0  ?
                      SizedBox(width: 50,)
                    :
                      IconButton(
                        onPressed: () {
                          _pageController.previousPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
                        }, icon: Icon(Icons.arrow_back_ios_new_rounded, size: 25,)
                      ),

                    InkWell(
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(context, '/homepage', (route) => false);
                      },
                      
                      child: Text('Skip', style: TextStyle(
                        fontSize: 17,
                        color: Colors.black
                      ),),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}