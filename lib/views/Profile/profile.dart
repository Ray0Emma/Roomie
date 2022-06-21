// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roomie/controllers/userController.dart';

import 'package:roomie/resources/app_colors.dart';
import 'package:roomie/resources/firebase_auth_constants.dart';
import 'package:roomie/views/Home/widgets/navigation.dart';
import 'package:roomie/views/Profile/editInformations.dart';
import 'package:roomie/views/Profile/editProfile.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
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
                        FutureBuilder(
                          future: UserController.instance.loadImage(),
                          builder:
                              (BuildContext context, AsyncSnapshot usnapshot) {
                            if (usnapshot.hasData &&
                                usnapshot.connectionState ==
                                    ConnectionState.done &&
                                usnapshot.data["profile"] != null) {
                              return SizedBox(
                                width: 130,
                                height: 130,
                                child: CircleAvatar(
                                  backgroundColor:
                                      AppColors.GRAY_Forced.withOpacity(0.3),
                                  child: ClipOval(
                                    child: SizedBox(
                                      width: 130,
                                      height: 130,
                                      child: Image.network(
                                        usnapshot.data["profile"],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return Container();
                            }
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        FutureBuilder(
                            future: UserController.instance.loadImage(),
                            builder: (BuildContext context,
                                AsyncSnapshot usnapshot) {
                              if (usnapshot.hasData &&
                                  usnapshot.connectionState ==
                                      ConnectionState.done) {
                                return Column(
                                  children: [
                                    Text(
                                      usnapshot.data["name"],
                                      style: TextStyle(
                                          color: AppColors.PRIMARY_COLOR_DARK,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "+212 " + usnapshot.data["phone"],
                                      style: TextStyle(
                                        color: AppColors.GRAY_Forced,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                );
                              } else {
                                return Column(
                                  children: [
                                    Text(
                                      "Your Name",
                                      style: TextStyle(
                                          color: AppColors.PRIMARY_COLOR_DARK,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "21 years old",
                                      style: TextStyle(
                                        color: AppColors.GRAY_Forced,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                );
                              }
                            }),
                        const Divider(
                          height: 47,
                          thickness: 1,
                          color: Color.fromARGB(162, 177, 179, 179),
                        ),
                        GestureDetector(
                            onTap: () {
                              Get.to(EditProfile());
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.person,
                                      color: AppColors.PRIMARY_COLOR_DARK,
                                      size: 24,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      'Edit Profile',
                                      style: TextStyle(
                                          color: AppColors.PRIMARY_COLOR_DARK,
                                          fontSize: 19),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: AppColors.PRIMARY_COLOR_DARK,
                                ),
                              ],
                            )),
                        SizedBox(
                          height: 25,
                        ),
                        GestureDetector(
                            onTap: () {
                              Get.to(EditInformations());
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.info,
                                      color: AppColors.PRIMARY_COLOR_DARK,
                                      size: 24,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      'Edit informations',
                                      style: TextStyle(
                                          color: AppColors.PRIMARY_COLOR_DARK,
                                          fontSize: 19),
                                    )
                                  ],
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: AppColors.PRIMARY_COLOR_DARK,
                                ),
                              ],
                            )),
                        SizedBox(
                          height: 25,
                        ),
                        GestureDetector(
                            onTap: () {
                              authController.signOut();
                              Get.offAll(MyNavigationBar());
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.logout,
                                  color: AppColors.RED_COLOR,
                                  size: 24,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  'Logout',
                                  style: TextStyle(
                                      color: AppColors.RED_COLOR, fontSize: 19),
                                )
                              ],
                            )),
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
