import 'dart:async';
import 'dart:convert';

import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:roomie/controllers/HomeController.dart';
import 'package:roomie/controllers/commandeController.dart';
import 'dart:math';

import '../../controllers/MapsController.dart';

class nearToMe extends StatefulWidget {
  const nearToMe({Key? key}) : super(key: key);

  @override
  State<nearToMe> createState() => _nearToMeState();
}

class _nearToMeState extends State<nearToMe> {
  mapsControlller c = Get.find();
  GoogleMapController? mapController; //contrller for Google map
  //PolylinePoints polylinePoints = PolylinePoints();
  String googleAPiKey = "AIzaSyCaM5mZeujKjAt43V-QHOHtdd-d2_0jkeM";
  Set<Marker> markers = Set(); //markers for google map
  Map<PolylineId, Polyline> polylines = {}; //polylines to show direction
  LatLng startLocation = LatLng(32.3699229, -6.3150989);
  LatLng endLocation = LatLng(32.3699229, -6.3150989);
  double distance = 0.0;
  BitmapDescriptor? myIcon;
  var list = [];
  // list = mapsControlller.instance.listPostionUser();
  CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();
  @override
  void dispose() {
    _customInfoWindowController.dispose();
    super.dispose();
  }

  @override
  initState() {
    // var list = [];
    // list = mapsControlller.instance.listPostionUser();

    asyncTasks() async {
      Future<Uint8List> getBytesFromAsset(String path, int width) async {
        ByteData data = await rootBundle.load(path);
        ui.Codec codec = await ui.instantiateImageCodec(
            data.buffer.asUint8List(),
            targetWidth: width);
        ui.FrameInfo fi = await codec.getNextFrame();
        return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
            .buffer
            .asUint8List();
      }

      final Uint8List markerIcon =
          await getBytesFromAsset('assets/images/home5.png', 100);
      await mapsControlller.instance.listPostionUser().then((value) => {
            setState(() {
              list = value
                  .map((f) => f.toString())
                  .toSet()
                  .toList()
                  .map((f) => json.decode(f) as List<dynamic>)
                  .toList();
            })
          });
      for (var i = 0; i < list.length; i++) {
        print(list.length);
        // print(list[i][1]);
        markers.add(Marker(
            //add distination location marker
            markerId: MarkerId(LatLng(list[i][0], list[i][1]).toString()),
            infoWindow: InfoWindow(
              //popup info
              title: "Roommate: ${homeController.instance.users[i]["name"]}",
              snippet:
                  "Budget: ${comandeContrller.instance.posts[i]["budget"]} DH/month",
            ),
            position: LatLng(list[i][0], list[i][1]),
            icon: BitmapDescriptor.fromBytes(markerIcon)));

        print([list[i][0], list[i][1]]);
      }
      print(markers);
    }

    setState(() {
      asyncTasks();
    });
    asyncTasks();

    BitmapDescriptor.fromAssetImage(ImageConfiguration(), 'assets/Home.png')
        .then((onValue) {
      myIcon = onValue;
    });

    // var list = [];
    // list = mapsControlller.instance.listPostionUser();

    print(
        "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||");

    // for (var i = 0; i < list.length; i++) {
    //   print(mapsControlller.instance.listAdress);
    //   print(list[i][1]);
    //   markers.add(Marker(
    //       //add distination location marker
    //       markerId: MarkerId(endLocation.toString()),
    //       infoWindow: InfoWindow(
    //         //popup info
    //         title: 'Destination Point ',
    //         snippet: 'Destination Marker',
    //       ),
    //       position: LatLng(list[i][0], list[i][1]),
    //       icon: BitmapDescriptor.defaultMarker));
    // }
    print(
        "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||");

    //getDirections(); //fetch direction polylines from Google API
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      GoogleMap(
        zoomGesturesEnabled: true,
        initialCameraPosition: CameraPosition(
          target: startLocation,
          zoom: 10,
        ),
        markers: markers,
        //polylines: Set<Polyline>.of(polylines.values),
        mapType: MapType.normal, //map type
        onMapCreated: (controller) {
          setState(() {
            mapController = controller;
            // for (var i = 0; i < list.length; i++) {
            //   print(comandeContrller.instance.lengthPost);
            //   // print(list[i][1]);
            //   markers.add(Marker(
            //       //add distination location marker
            //       markerId: MarkerId(endLocation.toString()),
            //       infoWindow: const InfoWindow(
            //         //popup info
            //         title: 'Destination Point ',
            //         snippet: 'Destination Marker',
            //       ),
            //       position: LatLng(list[i][0], list[i][1]),
            //       icon: BitmapDescriptor.defaultMarker));

            //   print(list);
            // }
          });
        },
      ),
      CustomInfoWindow(
        controller: _customInfoWindowController,
        height: 75,
        width: 150,
        offset: 50,
      )
    ]));
  }
} /*getDirections() async {
    List<LatLng> polylineCoordinates = [];
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleAPiKey,
      PointLatLng(startLocation.latitude, startLocation.longitude),
      PointLatLng(endLocation.latitude, endLocation.longitude),
      travelMode: TravelMode.driving,
    );
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(result.errorMessage);
    }
    //polulineCoordinates is the List of longitute and latidtude.
    double totalDistance = 0;
    for(var i = 0; i < polylineCoordinates.length-1; i++){
      totalDistance += calculateDistance(
          polylineCoordinates[i].latitude,
          polylineCoordinates[i].longitude,
          polylineCoordinates[i+1].latitude,
          polylineCoordinates[i+1].longitude);
    }
    print(totalDistance);
    setState(() {
      distance = totalDistance;
    });
    //add to the list of poly line coordinates
    addPolyLine(polylineCoordinates);
  }*/
/*
  addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.deepPurpleAccent,
      points: polylineCoordinates,
      width: 8,
    );
    polylines[id] = polyline;
    setState(() {});
  }*/
/*
  double calculateDistance(lat1, lon1, lat2, lon2){
    var p = 0.017453292519943295;
    var a = 0.5 - cos((lat2 - lat1) * p)/2 +
        cos(lat1 * p) * cos(lat2 * p) *
            (1 - cos((lon2 - lon1) * p))/2;
    return 12742 * asin(sqrt(a));
  }*/
//final Uint8List markerIcon =  getBytesFromAsset('assets/markers/${levels.markerIcon}', 100);