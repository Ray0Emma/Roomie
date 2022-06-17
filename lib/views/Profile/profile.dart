// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import 'package:roomie/resources/app_colors.dart';
import 'package:roomie/resources/firebase_auth_constants.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formState = GlobalKey<FormState>();

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.PRIMARY_COLOR,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
              child: Row(
                children: [],
              ),
            ),
            Expanded(
              child: Container(
                  width: double.infinity,
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
                          width: 130,
                          height: 130,
                          child: InkWell(
                            onTap: null,
                            child: CircleAvatar(
                              backgroundColor:
                                  AppColors.GRAY_Forced.withOpacity(0.3),
                              child: ClipOval(
                                child: SizedBox(
                                  width: 150.0,
                                  height: 150.0,
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.white,
                                    size: 100,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        GestureDetector(
                          onTap: () {
                            authController.signOut();
                          },
                          child: Text(
                            "LogOut",
                            style: TextStyle(
                                color: AppColors.RED_COLOR,
                                fontSize: 24,
                                fontWeight: FontWeight.w500),
                          ),
                        )
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
