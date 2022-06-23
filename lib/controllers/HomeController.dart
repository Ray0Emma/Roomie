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

class homeController extends GetxController {
  late String idpost;
  static homeController instance = Get.find();

  late Rx<User?> firebaseUser;
List posts=List.empty(growable: true).obs;
List users=List.empty(growable: true).obs;


  @override
  void onInit() {
    // print(Get.arguments);

print("///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////");
    print(getAllDataPostByContent("Rabat"));
print("///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////");

getAllDataPost();
    super.onInit();
  }























  getData() async {
    FirebaseFirestore.instance.collection("posts").snapshots().listen((event) {
      event.docs.forEach((element) async {
        var variable = await FirebaseFirestore.instance
            .collection('users')
            .doc(element.id)
            .get();
        print(variable.get("birthday"));
          users.add(variable);
        print("--------------------------------------------------------------");
        print(element.id);
        posts.add(element.data());
        print(element.data());
      });
      print("--------------------------------------------------------------");
    });
  }
  Future getDataUser(userID) async {
    //  print(Get.arguments);
    var variable =
    await FirebaseFirestore.instance.collection('users').doc(userID).get();
    return variable;

  }
  Future getAllDataPost() async {
    await FirebaseFirestore.instance.collection("posts").snapshots().listen((event) {
      event.docs.forEach((element) async {
        var variable = await FirebaseFirestore.instance
            .collection('users')
            .doc(element.id)
            .get();
        print(variable.get("birthday"));
        users.add(variable);
     posts.add(element);
      });
    });

  }
  Future getAllDataPostByContent(String name) async {
    List postfarah=[];
    await FirebaseFirestore.instance.collection("posts").snapshots().listen((event) {
      event.docs.forEach((element) async {

        if(element.data()["city"].contains(name)){
          var variable = await FirebaseFirestore.instance
              .collection('users')
              .doc(element.id)
              .get();
          print(variable.get("birthday"));
          users.add(variable);
          postfarah.add(element);}
      });
    });
   return postfarah.toList();
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
