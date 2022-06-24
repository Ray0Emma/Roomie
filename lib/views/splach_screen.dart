// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, depend_on_referenced_packages

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:roomie/resources/app_colors.dart';
import 'package:roomie/views/Home/widgets/navigation.dart';
import 'package:roomie/views/Mapscard/mapsCard.dart';
import 'package:roomie/views/roomDetails/room.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Roomie',
        home: AnimatedSplashScreen(
            duration: 3000,
            splash: Container(
              width: 200,
              height: 200,
              child: Image.asset(
                'assets/images/roomie.png',
              ),
            ),
            splashIconSize: double.infinity,
            nextScreen:MyNavigationBar(),
            splashTransition: SplashTransition.scaleTransition,
            // pageTransitionType: PageTransitionType.scale,
            backgroundColor: AppColors.PRIMARY_COLOR));
  }
}
