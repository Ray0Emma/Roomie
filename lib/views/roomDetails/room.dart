// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:roomie/resources/app_styles.dart';
import 'package:roomie/resources/firebase_auth_constants.dart';

import 'package:roomie/resources/app_colors.dart';
import 'package:roomie/views/roomDetails/widget/adresse.dart';
import 'package:roomie/views/roomDetails/widget/character.dart';
import 'package:roomie/views/roomDetails/widget/imagepost.dart';
import 'package:roomie/views/roomDetails/widget/profileUser.dart';

class rommDetails extends StatefulWidget {
  const rommDetails({Key? key}) : super(key: key);
  @override
  State<rommDetails> createState() => _rommDetailsState();
}

class _rommDetailsState extends State<rommDetails> {
  var idPost = Get.arguments;
  List lang = ["france", "merican", "souse", "tamazurt"];

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.PRIMARY_COLOR,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 11, horizontal: 30),
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Roomie details",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 28),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30))),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        imagepost(
                            "https://firebasestorage.googleapis.com/v0/b/roomie-589a9.appspot.com/o/photos%2F6f92a1948e175f59385308b580ae153c.png?alt=media&token=83111565-9989-464f-a417-1e7ac0d0bab4"),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            children: [
                              adressepost(
                                  "N 41 LOTS REDDAD, OUMDHAR, BENI MELLAL",
                                  3,
                                  "Beni Mellal"),
                              Divider(
                                thickness: 3,
                              ),
                              characher("Equipment", lang),
                              Divider(
                                thickness: 3,
                              ),
                              characher("Regulation", lang),
                              Divider(
                                thickness: 3,
                              ),
                              profileUser(
                                  "https://firebasestorage.googleapis.com/v0/b/roomie-589a9.appspot.com/o/photos%2F6f92a1948e175f59385308b580ae153c.png?alt=media&token=83111565-9989-464f-a417-1e7ac0d0bab4",
                                  "Farah hamada",
                                  "nice girl helped rachid for learning ",
                                  "13",
                                  "profetionnele"),
                              Divider(
                                thickness: 3,
                              ),
                              characher("Languages", lang),
                              Divider(
                                thickness: 3,
                              ),
                              characher("Personality", lang),
                              Divider(
                                thickness: 3,
                              ),
                              characher("LifeStyle", lang),
                              Divider(
                                thickness: 3,
                              ),
                              characher("Hobbis", lang),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${100} DH/ month",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 20),
                                  ),
                                  ElevatedButton.icon(
                                    onPressed: () {},
                                    icon: Icon(Icons.call),
                                    label: Text(
                                      "call",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        primary: AppColors.PRIMARY_COLOR,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 25, vertical: 12)),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
