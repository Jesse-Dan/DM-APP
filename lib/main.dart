import 'package:divine_mercy_app_the_right_way/app/nav_bar.dart';
import 'package:divine_mercy_app_the_right_way/app/create_user_page.dart';
import 'package:divine_mercy_app_the_right_way/app_theme.dart';
import 'package:divine_mercy_app_the_right_way/bindings/initial_binding.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // run the initialization for Mobile
  await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: 'DM Multi-trade Mobile App',
      darkTheme: darkThemeData(context),
      themeMode: ThemeMode.system,
      theme: lightThemeData(context),
      initialBinding: InitalBinding(),
      home: const SplashScreen(),
      getPages: [
        GetPage(
          name: Routes.DATA,
          page: () => ProfilePage(),
        ),
        GetPage(
          name: Routes.SPLASH_SCREEN,
          page: () => const SplashScreen(),
        ),
        GetPage(
          name: Routes.NAV_BAR,
          page: () => const ButtomNav(title: 'buttomm nav',),
        )
      ],
      initialRoute: Routes.SPLASH_SCREEN,
    );
  }
}

class Routes {
  static const String SPLASH_SCREEN = '/';
  static const String DATA = '/data';
  static const String NAV_BAR = '/nav_bar';

}
