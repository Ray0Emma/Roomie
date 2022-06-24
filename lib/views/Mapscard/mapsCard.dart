// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:roomie/resources/app_colors.dart';
import 'package:roomie/views/Profile/widgets/profileImage.dart';
import '../../controllers/MapsController.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';

class mapsCard extends StatefulWidget {
  @override
  MapsCardState createState() => MapsCardState();
}

class MapsCardState extends State<mapsCard> {
  mapsControlller c = Get.find();

  var one;
  late bool services;
  Position? position;
  LocationPermission? per;
  var lat;
  var long;
  List bbb = [];

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.

  GoogleMapController? mapController; //contrller for Google map
  Set<Marker> markers = Set(); //markers for google map
  LatLng startLocation = LatLng(32.3699225, -6.3150989);
  LatLng endLocation = LatLng(32.3384162, -6.1934452);
  var distance;
  BitmapDescriptor? myIcon;
  List atherUser = [];

  @override
  initState() {
    var one = Get.arguments;
    print(one[0]["first"]);
    mapsControlller.instance
        .getPostionOfCartchose(one[0]["first"])
        .then((value) {
      setState(() {
        lat = value[0].latitude;
        long = value[0].longitude;
        markers.add(Marker(
            //add distination location marker
            markerId: MarkerId(startLocation.toString()),
            infoWindow: InfoWindow(
                //popup info
                // title: 'Destination Point ',
                // snippet: 'Destination Marker',
                ),
            position: LatLng(mapsControlller.instance.bbb[0],
                mapsControlller.instance.bbb[1]),
            icon: BitmapDescriptor.defaultMarker));
        markers.add(Marker(
            //add distination location marker
            markerId: MarkerId(endLocation.toString()),
            infoWindow: InfoWindow(
                //popup info
                // title: 'Destination Point ',
                // snippet: 'Destination Marker',
                ),
            position: LatLng(lat, long),
            icon: BitmapDescriptor.defaultMarkerWithHue(90)));
        mapsControlller.instance.getPolyline(mapsControlller.instance.bbb[0],
            mapsControlller.instance.bbb[1], lat, long);

        distance = Geolocator.distanceBetween(mapsControlller.instance.bbb[0],
            mapsControlller.instance.bbb[1], lat, long);
        distance = distance / 1000;
      });
    });

    super.initState();
  }

  double _originLatitude = 32.3699225, _originLongitude = -6.3150989;
  double _destLatitude = 32.3384162, _destLongitude = -6.1934452;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.PRIMARY_COLOR,
        body: GetBuilder<mapsControlller>(
            builder: (mapscontrolller) => Stack(children: [
                  Positioned(
                    top: 0,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 11, horizontal: 30),
                            child: Row(
                              children: [
                                arrowBack(),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Location",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 28),
                                )
                              ],
                            ),
                          ),
                        ]),
                  ),
                  GoogleMap(
                    polylines:
                        Set<Polyline>.of(mapscontrolller.polylines.values),
                    zoomGesturesEnabled: true,
                    markers: markers,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(
                          mapscontrolller.bbb[0], mapscontrolller.bbb[1]),
                      zoom: 8.0,
                    ),

                    mapType: MapType.normal, //map type
                    onMapCreated: (controller) {
                      setState(() {
                        mapController = controller;
                      });
                    },
                  ),
                  Positioned(
                    bottom: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 80,
                          width: 300,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: AppColors.PRIMARY_COLOR,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30))),
                          child: Center(
                            child: (distance != null)
                                ? Text(
                                    " Distance : ${distance.floor()}  KM",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w800),
                                  )
                                : Text('0 KM',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w800)),
                          ),
                        ),
                      ],
                    ),
                  )
                ])));
  }
}
