// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:roomie/views/widgets/navigation.dart';
import 'package:roomie/views/widgets/appbar.dart';
import 'package:roomie/views/widgets/request_card.dart';
import 'package:roomie/views/widgets/filter.dart';

import 'widgets/filterNumber.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xff30816F),
            ),
            child: Column(
              children: [
                // ****AppBar start****
                MyAppBar(),
                SizedBox(
                  height: 36,
                ),
                // ****AppBar End****
                Container(
                  width: MediaQuery.of(context).size.width,
                  // height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                    color: Colors.white,
                  ),
                  // ***filters***
                  child: Column(
                    children: [
                      SizedBox(
                        height: 36,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            FiltreNumber("Filtre"),
                            FilterCard("room "),
                            FilterCard("man "),
                            FilterCard("woman "),
                            FilterCard("appartement "),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ListView(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        children: [
                          requestCard(
                              "Farah",
                              21,
                              1000,
                              "images/users/user1.jpg",
                              3,
                              "assets/images/users/user2.jpg"),
                          requestCard(
                              "Rachid",
                              21,
                              2000,
                              "images/users/ranpo.jpg",
                              2,
                              "assets/images/users/ranpo.jpg"),
                          requestCard(
                              "Ahmadi",
                              25,
                              2300,
                              "images/users/user1.jpg",
                              4,
                              "assets/images/users/user2.jpg"),
                          requestCard(
                              "Bourigue",
                              30,
                              5000,
                              "images/users/ranpo.jpg",
                              4,
                              "assets/images/users/ranpo.jpg"),
                        ],
                      )
                    ],
                  ),

                  // *** end filters
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
