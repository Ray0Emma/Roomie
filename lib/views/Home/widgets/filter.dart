// ignore_for_file: prefer_const_literals_to_create_immutables, non_constant_identifier_names
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:roomie/resources/app_colors.dart';

Widget FilterCard(String name) {
  return InkWell(
    onTap: () {
      print("jdj");
    },
    child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: AppColors.PRIMARY_COLOR_LIGHT,
            border: Border.all(
                color: AppColors.PRIMARY_COLOR_DARK.withOpacity(0.1))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: TextStyle(fontSize: 15),
            ),
            Icon(
              Icons.remove_circle,
              color: AppColors.RED_COLOR,
              size: 15,
            )
          ],
        )),
  );
}
