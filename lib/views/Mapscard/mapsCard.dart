import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import '../../controllers/MapsController.dart';



class mapsCard extends StatefulWidget{
  @override
  MapsCardState createState() => MapsCardState();
}

class MapsCardState extends State<mapsCard> {
  mapsControlller c = Get.find();


  late bool services;
  Position ? position;
  LocationPermission ? per;
  var lat;
  var long;
  late  CameraPosition _kGooglePlex="" as CameraPosition;
  Future getper ()async{
    services=await Geolocator.isLocationServiceEnabled();
    per=await Geolocator.checkPermission();

    if(per==LocationPermission.always){
      getLaLon();
    }
    return per;
  }



  Future <void> getLaLon()async{

    position=await Geolocator.getCurrentPosition().then((value) => value);
    lat=position?.latitude;
    long=position?.longitude;

    print("***********************************************************************************");
    print(lat);
    print("***********************************************************************************");

    _kGooglePlex = CameraPosition(

      target: LatLng(lat, long),
      zoom: 15,
    );



    setState(() {
    });

  }

  /*
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

    for(var i=0;i<list.length;i++){

      print(list[i][1]);
      markers.add(Marker( //add distination location marker
          markerId: MarkerId(endLocation.toString()),
          infoWindow: InfoWindow( //popup info
            title: 'Destination Point ',
            snippet: 'Destination Marker',

          ),
          position: LatLng(list[i][0],list[i][1]),
          icon: BitmapDescriptor.defaultMarker
      ));
    }
    print("||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||");
    super.initState();
  }
*/


  @override
  void initState() {

  getper ();
  super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Stack(
            children:[

              GoogleMap(
                zoomGesturesEnabled: true,
                initialCameraPosition: _kGooglePlex,
                //markers: markers,
                //polylines: Set<Polyline>.of(polylines.values),
                mapType: MapType.normal, //map type
                onMapCreated: (controller) {
                  setState(() {

                   // mapController = controller;





                  });
                },
              ),


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