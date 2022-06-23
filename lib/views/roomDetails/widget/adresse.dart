// ignore_for_file: unnecessary_brace_in_string_interps, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roomie/resources/app_colors.dart';

Widget adressepost(String adresse, int capacity, String ville) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 18),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          adresse.toUpperCase(),
          style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w800,
              color: AppColors.BLACK_COLOR),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${capacity} Personnes",
              style: TextStyle(
                  color: AppColors.BLACK_COLOR, fontWeight: FontWeight.w300),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.location_on, color: AppColors.RED_COLOR),
                SizedBox(
                  height: 5,
                ),
                Text(
                  ville,
                  style: TextStyle(
                      color: AppColors.BLACK_COLOR,
                      fontWeight: FontWeight.w500),
                ),
              ],
            )
          ],
        )
      ],
    ),
  );
}
