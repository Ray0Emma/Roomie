// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:roomie/views/widgets/navigation.dart';
import 'package:roomie/views/widgets/appbar.dart';
// import 'package:roomie/views/widgets/request_card.dart';
import 'package:roomie/views/widgets/filter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyNavigationBar(),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xff4943F0),
          ),
          child: Column(
            children: [
              // ****AppBar start****
              MyAppBar(),
              // ****AppBar End****
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                  color: Colors.white,
                ),
                // ***filters***
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    children: [
                      FilterCard(text: "Filter 0"),
                      FilterCard(text: "man x"),
                      FilterCard(text: "woman x"),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
