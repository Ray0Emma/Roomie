// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roomie/resources/app_colors.dart';

Widget profileUser(
    String image, String name, String aboutme, int age, String etat) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 12),
    child: Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Roommate",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  color: AppColors.BLACK_COLOR),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  color: Colors.blueAccent,
                  image: DecorationImage(
                      image: NetworkImage(image), fit: BoxFit.cover)),
            ),
            // SizedBox(
            //   width: 8,
            // ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: AppColors.BLACK_COLOR),
                ),
                SizedBox(height: 15),
                Text(
                  aboutme,
                  style: TextStyle(fontSize: 10, color: AppColors.BLACK_COLOR),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  etat,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: AppColors.BLACK_COLOR),
                ),
                SizedBox(height: 50),
                Text(
                  "$age Years old",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: AppColors.BLACK_COLOR),
                )
              ],
            )
          ],
        ),
        // SizedBox(
        //   height: 10,
        // ),
        // Text(
        //   "$age Years old",
        //   style: TextStyle(
        //       fontSize: 12,
        //       fontWeight: FontWeight.w300,
        //       color: AppColors.BLACK_COLOR),
        // )
      ],
    ),
  );
}
