// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import '../resources/app_colors.dart';
import '../widgets/searchBar.dart';

Widget MyAppBar() {
  return Column(
    children: <Widget>[
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Stack(
          //  Stack places the objects in the upper left corner
          children: <Widget>[
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  // color: Colors.blueAccent,
                  border: Border.all(color: AppColors.GRAY_COLOR, width: 4),
                  image: DecorationImage(
                      image: AssetImage("assets/images/users/user1.jpg"),
                      fit: BoxFit.cover)),
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
