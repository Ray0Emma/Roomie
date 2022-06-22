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
              child: GetBuilder<roomeiDetails>(
                builder: (roomeidetails) =>Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30))),
                    child:Stack(children: [
                      FutureBuilder(
                        future: roomeidetails.getDataUser(idPost),
                        builder:
                            (BuildContext context, AsyncSnapshot usnapshotUser) {
                          return   FutureBuilder(
                            future: roomeidetails.getDataPost(idPost),
                            builder:
                                (BuildContext context, AsyncSnapshot usnapshotpost) {
                              if (usnapshotpost.hasData && usnapshotUser.hasData &&
                                  usnapshotpost.connectionState ==
                                      ConnectionState.done) {
                                return
                                 Stack(

                                   children: [

                                   SingleChildScrollView(
                                     child: Column(
                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                       children: [
                                         imagepost(usnapshotpost.data["imageUri"])
                                         ,
                                         Container(
                                           padding: EdgeInsets.symmetric(horizontal: 16),
                                           child: Column(
                                             children: [
                                               adressepost(
                                                   usnapshotpost.data["addresse"],
                                                   usnapshotpost.data["capacity"],
                                                   citys[usnapshotpost.data["city"]]),
                                               Divider(
                                                 thickness: 3,
                                               ),
                                               characher("Equipment", usnapshotpost.data["equipment"]),
                                               Divider(
                                                 thickness: 3,
                                               ),
                                               characher("Regulation", usnapshotpost.data["regulation"]),
                                               Divider(
                                                 thickness: 3,
                                               ),
                                               profileUser(
                                                   usnapshotUser.data["profile"],
                                                   usnapshotUser.data["name"],
                                                   usnapshotUser.data["about"],
                                                   roomeidetails.calculateAge(usnapshotUser.data["birthday"]),
                                                   usnapshotUser.data["status"]),
                                               Divider(
                                                 thickness: 3,
                                               ),
                                               characher("Languages", usnapshotUser.data["languages"]),
                                               Divider(
                                                 thickness: 3,
                                               ),
                                               characher("Personality", usnapshotUser.data["personality"]),
                                               Divider(
                                                 thickness: 3,
                                               ),
                                               characher("LifeStyle", usnapshotUser.data["lifestyle"]),
                                               Divider(
                                                 thickness: 3,
                                               ),
                                               characher("Hobbis",  usnapshotUser.data["hobbis"]),
                                               SizedBox(
                                                 height: 10,
                                               ),


                                             ],
                                           ),
                                         )
                                       ],
                                     ),
                                   ),


                                   Positioned(
                                     bottom:0,
                                     child: Container(
                                        width:350 ,
                                        height: 80,
                                       decoration: BoxDecoration(color: Colors.white),
                                       child: Row(
                                         mainAxisAlignment:
                                         MainAxisAlignment.spaceAround,
                                         children: [
                                           Text(
                                             "${usnapshotpost.data["budget"]} DH/ month",
                                             style: TextStyle(
                                                 fontWeight: FontWeight.w800,
                                                 fontSize: 20),
                                           ),
                                           ElevatedButton.icon(
                                             onPressed: () {

                                               launch("tel://${ usnapshotUser.data["phone"]}");

                                             },
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
                                     ),
                                   )
                                 ],);
                              } else {
                                return Container(
                                  width: double.infinity,
                                  child:Center(child: CircularProgressIndicator(

                                    color: AppColors.PRIMARY_COLOR,

                                  ),),);
                              }
                            },
                          );

                        },
                      )
                    ],)
                )) ,
            ),
          ],
        ),
      ),
    );
  }
}
