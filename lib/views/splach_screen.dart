// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, depend_on_referenced_packages

import 'package:animated_splash_screen/animated_splash_screen.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import './home.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Roomie',
        home: AnimatedSplashScreen(
            duration: 3000,
            splash: SizedBox(
              height: 700,
              width: 180,
              child: SvgPicture.asset('images/splash.svg', fit: BoxFit.cover),
            ),
            nextScreen: HomePage(),
            splashTransition: SplashTransition.scaleTransition,
            // pageTransitionType: PageTransitionType.scale,
            backgroundColor: Color.fromARGB(206, 255, 255, 255)));
  }
}
