// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:roomie/models/PostModel.dart';
import 'package:roomie/resources/app_styles.dart';
import 'package:roomie/resources/firebase_auth_constants.dart';

import 'package:roomie/resources/app_colors.dart';
import 'package:roomie/views/Profile/widgets/profileImage.dart';
import 'package:roomie/views/roomDetails/widget/adresse.dart';
import 'package:roomie/views/roomDetails/widget/character.dart';
import 'package:roomie/views/roomDetails/widget/imagepost.dart';
import 'package:roomie/views/roomDetails/widget/profileUser.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controllers/RoomeDetails.dart';

class rommDetails extends StatefulWidget {
  const rommDetails({Key? key}) : super(key: key);
  @override
  State<rommDetails> createState() => _rommDetailsState();
}

class _rommDetailsState extends State<rommDetails> {
  roomeiDetails c = Get.find();

  var idPost = Get.arguments;
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.PRIMARY_COLOR,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
              child: Row(
                children: [
                  arrowBack(),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Room details",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 25),
                  )
                ],
              ),
            ),
            Expanded(
              child: GetBuilder<roomeiDetails>(
                  builder: (roomeidetails) => Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              topLeft: Radius.circular(30))),
                      child: Stack(
                        children: [
                          FutureBuilder(
                            future: roomeidetails.getDataUser(idPost),
                            builder: (BuildContext context,
                                AsyncSnapshot usnapshotUser) {
                              return FutureBuilder(
                                future: roomeidetails.getDataPost(idPost),
                                builder: (BuildContext context,
                                    AsyncSnapshot usnapshotpost) {
                                  if (usnapshotpost.hasData &&
                                      usnapshotUser.hasData &&
                                      usnapshotpost.connectionState ==
                                          ConnectionState.done) {
                                    return Stack(
                                      children: [
                                        SingleChildScrollView(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              imagepost(usnapshotpost
                                                  .data["imageUri"]),
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 16),
                                                child: Column(
                                                  children: [
                                                    adressepost(
                                                        usnapshotpost
                                                            .data["addresse"],
                                                        usnapshotpost
                                                            .data["capacity"],
                                                        usnapshotpost
                                                            .data["city"]),
                                                    Divider(
                                                      thickness: 1,
                                                      color: Color.fromARGB(
                                                          162, 177, 179, 179),
                                                    ),
                                                    characher(
                                                        "Equipments",
                                                        usnapshotpost
                                                            .data["equipment"]),
                                                    Divider(
                                                      thickness: 1,
                                                      color: Color.fromARGB(
                                                          162, 177, 179, 179),
                                                    ),
                                                    characher(
                                                        "Regulations",
                                                        usnapshotpost.data[
                                                            "regulation"]),
                                                    Divider(
                                                      thickness: 1,
                                                      color: Color.fromARGB(
                                                          162, 177, 179, 179),
                                                    ),
                                                    profileUser(
                                                        usnapshotUser
                                                            .data["profile"],
                                                        usnapshotUser
                                                            .data["name"],
                                                        usnapshotUser
                                                            .data["about"],
                                                        roomeidetails
                                                            .calculateAge(
                                                                usnapshotUser
                                                                        .data[
                                                                    "birthday"]),
                                                        usnapshotUser
                                                            .data["status"]),
                                                    Divider(
                                                      thickness: 1,
                                                      color: Color.fromARGB(
                                                          162, 177, 179, 179),
                                                    ),
                                                    characher(
                                                        "Languages",
                                                        usnapshotUser
                                                            .data["languages"]),
                                                    Divider(
                                                      thickness: 1,
                                                      color: Color.fromARGB(
                                                          162, 177, 179, 179),
                                                    ),
                                                    characher(
                                                        "Personality",
                                                        usnapshotUser.data[
                                                            "personality"]),
                                                    Divider(
                                                      thickness: 1,
                                                      color: Color.fromARGB(
                                                          162, 177, 179, 179),
                                                    ),
                                                    characher(
                                                        "LifeStyle",
                                                        usnapshotUser
                                                            .data["lifestyle"]),
                                                    Divider(
                                                      thickness: 1,
                                                      color: Color.fromARGB(
                                                          162, 177, 179, 179),
                                                    ),
                                                    characher(
                                                        "Hobbis",
                                                        usnapshotUser
                                                            .data["hobbis"]),
                                                    SizedBox(
                                                      height: 90,
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 0,
                                          child: Column(
                                            // crossAxisAlignment:
                                            //     CrossAxisAlignment.stretch,
                                            children: [
                                              Container(
                                                width: 360,
                                                height: 80,
                                                decoration:
                                                    BoxDecoration(boxShadow: [
                                                  BoxShadow(
                                                    color: AppColors.GRAY_Forced
                                                        .withOpacity(0.5),
                                                    spreadRadius: 5,
                                                    blurRadius: 7,
                                                  )
                                                ], color: Colors.white),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Text(
                                                      "${usnapshotpost.data["budget"]} DH/ month",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w800,
                                                          fontSize: 20,
                                                          color: AppColors
                                                              .BLACK_COLOR),
                                                    ),
                                                    ElevatedButton.icon(
                                                      onPressed: () {
                                                        launch(
                                                            "tel://${usnapshotUser.data["phone"]}");
                                                      },
                                                      icon: Icon(Icons.call),
                                                      label: Text(
                                                        "Call",
                                                        style: TextStyle(
                                                            fontSize: 20),
                                                      ),
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              primary: AppColors
                                                                  .PRIMARY_COLOR,
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          25,
                                                                      vertical:
                                                                          12)),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    );
                                  } else {
                                    return Container(
                                      width: double.infinity,
                                      child: Center(
                                        child: CircularProgressIndicator(
                                          color: AppColors.PRIMARY_COLOR,
                                        ),
                                      ),
                                    );
                                  }
                                },
                              );
                            },
                          )
                        ],
                      ))),
            ),
          ],
        ),
      ),
    );
  }
}
