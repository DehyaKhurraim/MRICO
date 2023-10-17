import 'package:flutter/material.dart';
import 'package:untitled1/Screens/HomeScreen.dart';
import 'package:untitled1/Screens/Login.dart';
import 'package:untitled1/Screens/Profile.dart';
import 'package:untitled1/Screens/PropertiesSeeAllScreen.dart';
import 'package:untitled1/Screens/SignUp.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'M-Rico',
      home: ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(context, LoginScreen()),
        maxWidth: 1200,
        minWidth: 450,
        defaultScale: true,
        breakpoints: [
          ResponsiveBreakpoint.resize(450, name: MOBILE),
          ResponsiveBreakpoint.autoScale(800, name: MOBILE),
          ResponsiveBreakpoint.autoScale(800, name: TABLET),
          ResponsiveBreakpoint.autoScale(1000, name: TABLET),
          ResponsiveBreakpoint.resize(1200, name: DESKTOP),
          ResponsiveBreakpoint.autoScale(2460, name: "4K"),
        ],
        background: Container(
          color: Color(0xFFF5F5F5),
        ),
      ),
    );
    // home: PropertiesSeeAllScreen(),
  }
}
