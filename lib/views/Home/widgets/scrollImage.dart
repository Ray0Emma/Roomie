// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names

import 'package:flutter/material.dart';

Widget scrollImage(String image) {
  return Container(
    height: 300,
    width: 300,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.blueAccent,
        image: DecorationImage(image:NetworkImage(image), fit: BoxFit.cover)),
  );
}
