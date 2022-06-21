import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../resources/firebase_auth_constants.dart';

class roomeiDetails extends GetxController {
  late String idpost;
  static roomeiDetails instance = Get.find();

  late Rx<User?> firebaseUser;


  //

  @override
  void onInit() {
    // print(Get.arguments);

    super.onInit();
  }

  Future getDataUser(userID) async {
   //  print(Get.arguments);
    var variable =
    await FirebaseFirestore.instance.collection('users').doc(userID).get();
    return variable;

  }
  Future getDataPost(userID) async {
    //  print(Get.arguments);
    var variable =
    await FirebaseFirestore.instance.collection('posts').doc(userID).get();
    return variable;

  }

  calculateAge(String birthDateString) {
    String datePattern = "yyyy-mm-dd";

    DateTime birthDate = DateFormat(datePattern).parse(birthDateString);
    DateTime today = DateTime.now();

    int age = today.year - birthDate.year;
    int month1 = today.month;
    int month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = today.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age;
  }

}
