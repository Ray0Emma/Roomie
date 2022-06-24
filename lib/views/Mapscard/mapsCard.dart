import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:roomie/resources/app_colors.dart';
import '../../controllers/MapsController.dart';

import 'package:geolocator/geolocator.dart';

class mapsCard extends StatefulWidget{
  @override
  MapsCardState createState() => MapsCardState();
}

class MapsCardState extends State<mapsCard> {
  mapsControlller c = Get.find();


  late bool services;
  Position ? position;
  LocationPermission ? per;
  var lat=0;
  var long=0;
List bbb=[];

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.

getxy(){
/*List list=[];
  var position=_determinePosition().then((value){
   // lat=value.latitude;
   // long=value.longitude;
    list.add(lat);
    list.add(long);
    print("x-------------------"+value.longitude.toString()+"y---------------------"+value.latitude.toString());
  });
  return list;*/
}

  GoogleMapController? mapController; //contrller for Google map
  Set<Marker> markers = Set(); //markers for google map
  LatLng startLocation = LatLng(32.3699225,-6.3150989);
  LatLng endLocation = LatLng(32.3384162,-6.1934452);
  double distance = 0.0;
  BitmapDescriptor? myIcon;

  @override
  initState(){

    BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'assets/Home.png')
        .then((onValue) {
      myIcon = onValue;
    });


    List list=[];
    list= mapsControlller.instance.listPostionUser();

    print("||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||");

      markers.add(Marker( //add distination location marker
          markerId: MarkerId(endLocation.toString()),
          infoWindow: InfoWindow( //popup info
            title: 'Destination Point ',
            snippet: 'Destination Marker',

          ),
          position: LatLng(mapsControlller.instance.bbb[0],mapsControlller.instance.bbb[1]),
          icon: BitmapDescriptor.defaultMarker
      ));

    print("||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||");
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Stack(
            children:[

              GoogleMap(
                zoomGesturesEnabled: true,
                markers:markers,
                initialCameraPosition: CameraPosition(

                  target: LatLng(mapsControlller.instance.bbb[0],mapsControlller.instance.bbb[1]),
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
              child: Container(

                height: 100,

                decoration: BoxDecoration(
                  color: AppColors.PRIMARY_COLOR
                ),
                child: Text("${mapsControlller.instance.bbb[0]}",style: TextStyle(),),),
            )
            ]
        )
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