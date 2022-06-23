import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget imagepost(String image) {
  return Container(
    height: 220,
    width: double.infinity,
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(30), topLeft: Radius.circular(30)),
        color: Colors.blueAccent,
        image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover)),
  );
}
