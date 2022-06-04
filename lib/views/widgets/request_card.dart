// ignore_for_file: non_constant_identifier_names, file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
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
          color: Color.fromRGBO(245, 247, 249, 0.953),
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
                title: Text(
                  name,
                ),
                tileColor: Color(0xff060935),
                subtitle: Text(
                  "$age years old",
                ),
                trailing:
                    Icon(Icons.location_on_outlined, color: Color(0xffE74040)),
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
                      style: TextStyle(fontWeight: FontWeight.w800)),
                  Text("$budget DH/ month",
                      style: TextStyle(fontWeight: FontWeight.w800))
                ],
              ),
            )
          ],
        ),
      ));
}
