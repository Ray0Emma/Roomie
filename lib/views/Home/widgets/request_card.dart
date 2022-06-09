// ignore_for_file: non_constant_identifier_names, file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:roomie/resources/app_colors.dart';
import 'scrollImage.dart';

Widget requestCard(String name, int age, double budget, String localisation,
    int capacity, String profile) {
  return InkWell(
      onTap: () {
        null;
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
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  scrollImage("assets/images/rooms/room1.webp"),
                  scrollImage("assets/images/rooms/room2.jpg"),
                  scrollImage("assets/images/rooms/room3.webp"),
                ],
              ),
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
                trailing: Icon(Icons.location_on_outlined,
                    color: AppColors.RED_COLOR),
                leading: Stack(children: [
                  CircleAvatar(
                    backgroundColor: Color(0xff00A3FF),
                    backgroundImage: AssetImage(profile),
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
