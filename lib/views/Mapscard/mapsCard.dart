import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:roomie/resources/app_colors.dart';
import '../../controllers/MapsController.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';

class mapsCard extends StatefulWidget{
  @override
  MapsCardState createState() => MapsCardState();
}

class MapsCardState extends State<mapsCard> {
  mapsControlller c = Get.find();

  var one;
  late bool services;
  Position ? position;
  LocationPermission ? per;
  var lat;
  var long;
List bbb=[];

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.



  GoogleMapController? mapController; //contrller for Google map
  Set<Marker> markers = Set(); //markers for google map
  LatLng startLocation = LatLng(32.3699225,-6.3150989);
  LatLng endLocation = LatLng(32.3384162,-6.1934452);
  var distance ;
  BitmapDescriptor? myIcon;
  List atherUser=[];

  @override
  initState(){
    var one = Get.arguments;
    print(one[0]["first"]);
    mapsControlller.instance.getPostionOfCartchose(one[0]["first"]).then((value){

      setState(() {
        lat=value[0].latitude;
        long=value[0].longitude;
        markers.add(Marker( //add distination location marker
            markerId: MarkerId(startLocation.toString()),
            infoWindow: InfoWindow( //popup info
              title: 'Destination Point ',
              snippet: 'Destination Marker',

            ),
            position:LatLng(mapsControlller.instance.bbb[0],mapsControlller.instance.bbb[1]),
            icon: BitmapDescriptor.defaultMarker
        ));
        markers.add(Marker( //add distination location marker
            markerId: MarkerId(endLocation.toString()),
            infoWindow: InfoWindow( //popup info
              title: 'Destination Point ',
              snippet: 'Destination Marker',

            ),
            position: LatLng(lat, long),
            icon: BitmapDescriptor.defaultMarkerWithHue(90)
        ));
        mapsControlller.instance.getPolyline(mapsControlller.instance.bbb[0],mapsControlller.instance.bbb[1],lat,long);

        distance=Geolocator.distanceBetween(mapsControlller.instance.bbb[0], mapsControlller.instance.bbb[1], lat, long);
        distance=distance/1000;


      });


    });




    print("||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||");





    print("||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||");
    super.initState();
  }
  double _originLatitude = 32.3699225, _originLongitude = -6.3150989;
  double _destLatitude = 32.3384162, _destLongitude = -6.1934452;



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: GetBuilder<mapsControlller>(
        builder: (mapscontrolller) =>Stack(
        children:[

          GoogleMap(
            polylines: Set<Polyline>.of(mapscontrolller.polylines.values),
            zoomGesturesEnabled: true,
            markers:markers,
            initialCameraPosition: CameraPosition(
              target: LatLng(mapscontrolller.bbb[0],mapscontrolller.bbb[1]),
              zoom: 8.0,
            ),
            //markers: markers,
            //polylines: Set<Polyline>.of(polylines.values),
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
                  width:300,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: AppColors.PRIMARY_COLOR,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight:Radius.circular(30) )
                         ),
                  child: Center(child: Text(" Distance :${distance.floor()}  KM",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w800),)),),
              ],
            ),
          )
        ]
    ))
    );
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