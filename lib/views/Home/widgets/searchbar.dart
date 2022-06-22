// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';

import 'package:roomie/resources/app_colors.dart';

Widget SearchBar() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    child: DecoratedBox(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: AppColors.GRAY_COLOR),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              cursorColor: AppColors.PRIMARY_COLOR,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search by city",
                contentPadding: EdgeInsets.all(20.0),
              ),
              keyboardType: TextInputType.text,
              maxLines: 1,
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.search,
              color: AppColors.PRIMARY_COLOR_DARK,
            ),
            onPressed: (){
            },
          ),
        ],
      ),
    ),
  );
}
