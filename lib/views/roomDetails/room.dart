// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:roomie/resources/app_styles.dart';
import 'package:roomie/resources/firebase_auth_constants.dart';

import 'package:roomie/resources/app_colors.dart';

class rommDetails extends StatefulWidget {
  const rommDetails({Key? key}) : super(key: key);
  @override
  State<rommDetails> createState() => _rommDetailsState();
}

class _rommDetailsState extends State<rommDetails> {

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.PRIMARY_COLOR,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 11, horizontal: 30),
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Roomie details",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 28),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30))),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 200,
                          child: SvgPicture.asset(
                            "assets/images/login.svg",
                          ),
                        ),

                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
