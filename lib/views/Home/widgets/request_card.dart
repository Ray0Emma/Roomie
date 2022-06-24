// ignore_for_file: non_constant_identifier_names, file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roomie/resources/app_colors.dart';
import 'package:roomie/views/Home/widgets/navigation.dart';
import 'package:roomie/views/Login/login.dart';
import 'package:roomie/views/roomDetails/room.dart';
import '../../Mapscard/mapsCard.dart';
import 'scrollImage.dart';

Widget requestCard(String name, int age, String budget, String localisation,
    int capacity, String profile, String imgpost, String idpost,String addresse) {
  return InkWell(
      onTap: () async {
        User? user;
        if (await FirebaseAuth.instance.currentUser == null) {
          // if the user is not found then the user is navigated to the Register Screen
          Get.offAll(() => const Register());
        } else {
          // if the user exists and logged in the the user is navigated to the Home Screen
          Get.to(rommDetails(),
              arguments: idpost); //it should be room_details view
          print('from card');
        }
        print('request card');
        print(await FirebaseAuth.instance.currentUser?.email);
      },
      child: Container(
        height: 300,
        margin: EdgeInsets.only(bottom: 15),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: AppColors.GRAY_COLOR,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 150,
              child: scrollImage(imgpost),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: ListTile(
                title: Text(name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.BLACK_COLOR)),
                subtitle: Text(
                  "$age years old",
                ),
                trailing: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.RED_COLOR.withOpacity(.1),
                    shadowColor: Colors.transparent,
                    shape: StadiumBorder(),
                  ),
                  onPressed: () async {
                    User? user;
                    if (await FirebaseAuth.instance.currentUser == null) {
                      // if the user is not found then the user is navigated to the Register Screen
                      Get.offAll(() => const Register());
                    } else {
                      // if the user exists and logged in the the user is navigated to the Home Screen
                      Get.to(() => mapsCard(), arguments: [
                        {"first": addresse},

                      ]); //it should be room_details view
                      print('from card');
                    }
                    print('request card');
                    print(await FirebaseAuth.instance.currentUser?.email);




                  },
                  child: Icon(Icons.location_on_outlined,
                      color: AppColors.RED_COLOR),
                ),
                leading: Stack(children: [
                  CircleAvatar(
                    backgroundColor: Color(0xff00A3FF),
                    backgroundImage: NetworkImage(profile),
                    radius: 25.0,
                  ),
                ]),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("$capacity personnes",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.BLACK_COLOR)),
                  Text("$budget DH/ month",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.BLACK_COLOR))
                ],
              ),
            )
          ],
        ),
      ));
}
