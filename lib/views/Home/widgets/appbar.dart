// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:roomie/resources/app_colors.dart';
import '../widgets/searchBar.dart';

class MyAppBar extends StatefulWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  var imageUrl = '';
  Future loadImage() async {
    //current user id
    final _userID = FirebaseAuth.instance.currentUser!.uid;

    //collect the image name
    var variable =
        await FirebaseFirestore.instance.collection('users').doc(_userID).get();

    //a list of images names (i need only one)
    // var _file_name = variable['profile'];

    // return await _file_name.toString();
    return variable;
  }

  // var _bar;

  // @override
  // void initState() {
  //   super.initState();
  //   _bar = asyncImage();
  // }

  // void _retry() {
  //   setState(() {
  //     _bar = asyncImage();
  //   });
  // }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   loadImage().then((value) => imageUrl = value);
  // }

  // @override
  // Future<void> setState(VoidCallback fn) async {
  //   // TODO: implement setState
  //   super.setState(fn);

  //   await loadImage().then((value) => imageUrl = value);
  // }

  @override
  Widget build(BuildContext context) {
    // _retry();
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Stack(
            //  Stack places the objects in the upper left corner
            children: <Widget>[
              FutureBuilder(
                future: loadImage(),
                builder: (BuildContext context, AsyncSnapshot usnapshot) {
                  if (usnapshot.hasData &&
                      usnapshot.connectionState == ConnectionState.done) {
                    return Container(
                      height: 50,
                      width: 50,
                      decoration: (FirebaseAuth.instance.currentUser != null)
                          ? BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              // color: Colors.blueAccent,
                              border: Border.all(
                                  color: AppColors.GRAY_COLOR, width: 4),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      usnapshot.data["profile"]), //user profile
                                  fit: BoxFit.cover))
                          : null,

                      // (imageUrl != '')
                      //     ?
                      // DecorationImage(
                      //         image: NetworkImage(imageUrl), //user profile
                      //         fit: BoxFit.cover)
                      //     : null,
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: const [
                    Text(
                      "Roomie",
                      style: TextStyle(
                        color: AppColors.PRIMARY_COLOR_LIGHT,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      "Find your next roommate",
                      style: TextStyle(color: AppColors.GRAY_COLOR),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SearchBar(),
      ],
    );
  }

  asyncImage() async {
    await loadImage().then((value) => imageUrl = value);
  }
}
// Widget MyAppBar() {

// }
