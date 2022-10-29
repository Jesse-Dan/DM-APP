import 'dart:async';

import 'package:divine_mercy_app_the_right_way/app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/login_controller.dart';
import 'intro_screen.dart';
import 'main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      LoginCtl controller = Get.find<LoginCtl>();
      if (controller.auth.currentUser != null) {
        Get.offAllNamed(Routes.DATA);
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => IntroScreen(),
          ),
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/mainlogo.png'),
            ],
          ),
        ),
      ),
      persistentFooterButtons: [
        Text(
          'developed by : FinnApps',
          textAlign: TextAlign.end,
          style: TextStyle(fontSize: 10),
        ),
      ],
    );
  }
}
