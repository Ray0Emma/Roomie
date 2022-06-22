import 'dart:async';
import 'dart:ffi';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math';



class nearToMe extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<nearToMe> {
  GoogleMapController? mapController; //contrller for Google map
  //PolylinePoints polylinePoints = PolylinePoints();
  String googleAPiKey = "AIzaSyCaM5mZeujKjAt43V-QHOHtdd-d2_0jkeM";
  Set<Marker> markers = Set(); //markers for google map
  Map<PolylineId, Polyline> polylines = {}; //polylines to show direction
  LatLng startLocation = LatLng(27.6683619, 85.3101895);
  LatLng endLocation = LatLng(27.6875436, 85.2751138);
  double distance = 0.0;
  BitmapDescriptor? myIcon;
  @override
  List listromm=[{},{},{}];
  initState(){
    BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'image/Home.png')
        .then((onValue) {
      myIcon = onValue;
    });


    //getDirections(); //fetch direction polylines from Google API
    super.initState();
  }
  /*getDirections() async {
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

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Stack(
            children:[
              GoogleMap(
                zoomGesturesEnabled: true,
                initialCameraPosition: CameraPosition(
                  target: startLocation,
                  zoom: 14.0,
                ),
                markers: markers,
                //polylines: Set<Polyline>.of(polylines.values),
                mapType: MapType.normal, //map type
                onMapCreated: (controller) {
                  setState(() {

                    mapController = controller;

                    markers.add(Marker( //add distination location marker
                        markerId: MarkerId(endLocation.toString()),
                        position: endLocation, //position of marker
                        infoWindow: InfoWindow( //popup info
                          title: 'Destination Point ',
                          snippet: 'Destination Marker',

                        ),
                        icon: myIcon!
                      //Icon for Marker
                    )

                    );

                  });
                },
              ),

            ]
        )
    );
  }
}