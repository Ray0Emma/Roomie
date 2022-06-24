import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:roomie/controllers/commandeController.dart';

class mapsControlller extends GetxController {
  late String idpost;
  static mapsControlller instance = Get.find();
  List listpostion = [].obs;
  List listAdress = [].obs;
  late Rx<User?> firebaseUser;

  //

  @override
  void onInit() {
    // print(Get.arguments);
    print(
        "///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////");
    // comandeContrller.instance.getData();
    // ever(comandeContrller.instance.posts, listPostionUser());
    // print(listPostionUser());
    print(
        "///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////");

    super.onInit();
  }

  listPostionUser() async {
    //  print(Get.arguments);
    print('hadaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaak');
    // print(comandeContrller.instance.posts);

    for (var i = 0; i < comandeContrller.instance.lengthPost; i++) {
      var map = comandeContrller.instance.posts[i];
      for (var k in map.keys) {
        if (k == 'addresse') {
          List<Location> locations = await locationFromAddress(map[k]);
          print([locations[0].latitude, locations[0].longitude]);
          listAdress.add([locations[0].latitude, locations[0].longitude]);
          print('kkkkkk');
        }
        print(map);
        print(k);
      }
    }
    print(listAdress);
    listpostion = [
      [32.3699225, -6.3150989],
      [32.3384162, -6.1934452],
      [32.3384162, -6.1934452],
      [32.7036419, -6.3108411]
    ];
    /* list.add(LatLng(32.3699229,-6.3150989));
    list.add(LatLng(2.3384162,-6.1934452));
    list.add(LatLng(32.3699229,-6.3150989));
    list.add(LatLng(32.3699229,-6.3150989));
    list.add(LatLng(32.3699229,-6.3150989));
    list.add(LatLng(32.3699229,-6.3150989));*/
    return listAdress;
  }

  getLocation(list) async {
    List<Location> locations = await locationFromAddress(list);
    listAdress.add([locations[0].latitude, locations[0].longitude]);
    return listAdress;
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
