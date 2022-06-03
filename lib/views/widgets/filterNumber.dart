// ignore_for_file: non_constant_identifier_names, file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

Widget FiltreNumber(String name) {
  return InkWell(
    onTap: () {
      print("Filtring ");
    },
    child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: Colors.white,
            border: Border.all(color: Colors.black12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Filtters",
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(
              width: 4,
            ),
            Text(
              "0",
              style: TextStyle(fontSize: 15, color: Color(0xffE74040)),
            )
          ],
        )),
  );
}
