
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class mapsControlller extends GetxController {
  late String idpost;
  static mapsControlller instance = Get.find();
  List listpostion=[];
  late Rx<User?> firebaseUser;


  //

  @override
  void onInit() {
    // print(Get.arguments);
    print("///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////");
    print(listPostionUser());
    print("///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////");

    super.onInit();
  }

  listPostionUser() {
    //  print(Get.arguments);
    listpostion=[[32.3699225,-6.3150989],[32.3384162,-6.1934452],[32.3384162,-6.1934452],[32.7036419,-6.3108411]];
   /* list.add(LatLng(32.3699229,-6.3150989));
    list.add(LatLng(2.3384162,-6.1934452));
    list.add(LatLng(32.3699229,-6.3150989));
    list.add(LatLng(32.3699229,-6.3150989));
    list.add(LatLng(32.3699229,-6.3150989));
    list.add(LatLng(32.3699229,-6.3150989));*/
    return listpostion;

  }


  calculateAge(String birthDateString) {
   /* String datePattern = "yyyy-mm-dd";
   // DateTime birthDate = DateFormat(datePattern).parse(birthDateString);
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
    return age;*/
  }

}
