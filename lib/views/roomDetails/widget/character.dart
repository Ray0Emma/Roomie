// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:roomie/resources/app_colors.dart';

Widget characher(String adresse, List lang) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          adresse,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w900,
              color: AppColors.BLACK_COLOR),
        ),
        SizedBox(
          height: 17,
        ),
        SizedBox(
          height: 26,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemCount: lang.length,
              itemBuilder: (context, i) {
                return Container(
                  margin: EdgeInsets.only(right: 6),
                  child: Text(
                    "${lang[i]}" ",",
                    style: TextStyle(
                        color: AppColors.BLACK_COLOR,
                        fontWeight: FontWeight.w300),
                  ),
                );
              }),
        )
      ],
    ),
  );
}
