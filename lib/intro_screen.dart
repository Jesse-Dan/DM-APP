import 'package:divine_mercy_app_the_right_way/app/nav_bar.dart';
import 'package:divine_mercy_app_the_right_way/authentication/Screens/Signup/components/signup_form.dart';
import 'package:divine_mercy_app_the_right_way/authentication/number_verification.dart';
import 'package:divine_mercy_app_the_right_way/models/intro_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'widgets/intro_widget.dart';

class IntroScreen extends StatefulWidget {
  IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  PageController pageController = PageController(initialPage: 0);

  List<IntroModel> introPageList = ([
    IntroModel('Number Verification', '', 'assets/images/intro1.png'),
    IntroModel('Find Markets Contact', '', 'assets/images/intro2.png'),
    IntroModel('Online Messaging', '', 'assets/images/intro3.png'),
  ]);

  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          Expanded(
            child: PageView(
              controller: pageController,
              pageSnapping: true,
              physics: const BouncingScrollPhysics(),
              onPageChanged: ((value) {
                setState(() {
                  currentIndex = value;
                });
              }),
              scrollDirection: Axis.horizontal,
              children: [
                IntroView(introModel: introPageList[0]),
                IntroView(introModel: introPageList[1]),
                IntroView(introModel: introPageList[2]),
              ],
            ),
          ),
          SmoothPageIndicator(
              controller: pageController, // PageController
              count: introPageList.length,
              effect: SlideEffect(
                dotColor: Colors.grey,
                activeDotColor: Theme.of(context).primaryColor,
              ), // your preferred effect
              onDotClicked: (index) {
                setState(() {
                  
                  // currentIndex = index;
                });
              }),
          Padding(
              padding: const EdgeInsets.only(
                left: 48,
                right: 48,
                bottom: 32,
                top: 32,
              ),
              child: currentIndex.isEqual(2)
                  ? Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context)
                                .disabledColor
                                .withOpacity(0.2),
                            blurRadius: 8,
                            offset: const Offset(4, 4),
                          ),
                        ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: (() {
                            Get.off(() => NumberScreen());
                          }),
                          borderRadius: BorderRadius.circular(24),
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 15,
                                bottom: 15,
                                left: MediaQuery.of(context).size.width / 4,
                                right: MediaQuery.of(context).size.width / 4),
                            child: const Text(
                              "Register",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    )
                  : null),
          SizedBox(
            height: MediaQuery.of(context).padding.bottom,
          )
        ],
      ),
    );
  }
}
