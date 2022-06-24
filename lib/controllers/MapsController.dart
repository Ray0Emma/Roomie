



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:geolocator/geolocator.dart';

import 'package:roomie/controllers/commandeController.dart';

class mapsControlller extends GetxController {
  late String idpost;
  static mapsControlller instance = Get.find();
  List listpostion = [].obs;
  List listAdress = [].obs;
  late Rx<User?> firebaseUser;
  late bool services;
  dynamic argumentData = Get.arguments;
  LocationPermission ? per;
  late LatLng currentPostion;
  double lat=8;
  double long=0;
 List bbb=[];
 List autheruser=[].obs;

  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  String googleAPiKey ="AIzaSyCaM5mZeujKjAt43V-QHOHtdd-d2_0jkeM";
  addPolyLine() {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id, color: Colors.red, points: polylineCoordinates,width:3
    );
    polylines[id] = polyline;
    update();
  }

  getPolyline(originLatitude,originLongitude,destLatitude,destLongitude) async {
    polylineCoordinates=[];
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        googleAPiKey,
        PointLatLng(originLatitude, originLongitude),
        PointLatLng(destLatitude,destLongitude),
        travelMode: TravelMode.driving,
        );
    //if (result.points.isNotEmpty) {
    // result.points.forEach((PointLatLng point) {
    polylineCoordinates.add(LatLng(originLatitude, originLongitude));
    polylineCoordinates.add(LatLng(destLatitude,destLongitude));
    // });
    //}
    addPolyLine();
    update();
  }
  Future<List<Location>>  getPostionOfCartchose(addresse) async {

    List<Location> locations = await locationFromAddress(addresse);
    autheruser.add(locations[0].latitude);
    autheruser.add(locations[0].latitude);
    print(locations[0].latitude.toString());
    print(autheruser[0]);

return locations;
  }

  @override
  void onInit() {
   // print(argumentData[0]['first']);
    print("///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////");
    print(listPostionUser());
    _determinePosition();

    print("///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////");
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


  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('***************************Location services are disabled.*********************************');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('***********************************Location permissions are denied************************************');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          '*********************************************************Location permissions are permanently denied, we cannot request permissions.************************************************************');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    Geolocator.getCurrentPosition().then((value){
      bbb.add(value.latitude);
      bbb.add(value.longitude);
    });
    return await Geolocator.getCurrentPosition();
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
