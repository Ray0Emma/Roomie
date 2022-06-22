// ignore_for_file: prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:roomie/controllers/commandeController.dart';
import 'package:roomie/controllers/userController.dart';
import 'package:roomie/resources/app_colors.dart';
import 'package:roomie/resources/firebase_auth_constants.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:roomie/views/splach_screen.dart';
import 'controllers/Binging.dart';
import 'controllers/auth_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await firebaseInitialization.then((value) {
    Get.put(AuthController());
    Get.put(UserController());
  });
  ThemeData(
    iconTheme: const IconThemeData(color: Colors.white),
    inputDecorationTheme: InputDecorationTheme(focusColor: Colors.white),
    colorScheme: ColorScheme.light(primary: AppColors.PRIMARY_COLOR),
    buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
  );
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: AppColors.PRIMARY_COLOR));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      title: 'Roomie',
      color: AppColors.PRIMARY_COLOR,
      theme: ThemeData().copyWith(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: AppColors.PRIMARY_COLOR,
            ),
        buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
