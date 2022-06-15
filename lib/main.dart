// ignore_for_file: prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl_standalone.dart';
import 'package:roomie/resources/app_colors.dart';

import 'package:roomie/resources/firebase_auth_constants.dart';
import 'package:roomie/views/Command/Command.dart';

import 'package:get/get.dart';
import 'package:flutter/services.dart';

import 'controllers/auth_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await firebaseInitialization.then((value) {
   Get.put(AuthController());
  });
  ThemeData(
      iconTheme: const IconThemeData(color: Colors.white),
      inputDecorationTheme: InputDecorationTheme(focusColor: Colors.white),
      colorScheme: ThemeData().colorScheme.copyWith(secondary: Colors.red));
      SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: AppColors.PRIMARY_COLOR));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Roomie',
      color: AppColors.PRIMARY_COLOR,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:uplodeimg(),
      debugShowCheckedModeBanner: false,
    );
  }
}

