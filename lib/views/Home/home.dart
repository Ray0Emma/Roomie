// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:roomie/controllers/commandeController.dart';
import 'package:roomie/views/Home/widgets/appbar.dart';
import 'package:roomie/views/Home/widgets/request_card.dart';
import 'package:roomie/views/Home/widgets/filter.dart';
import 'package:roomie/resources/app_colors.dart';

import '../Home/widgets/filterNumber.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  comandeContrller  c=Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child:GetBuilder<comandeContrller>(
        builder: (comandecontroller) =>Container(
      decoration: BoxDecoration(
        color: AppColors.PRIMARY_COLOR,
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
                ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    itemCount:comandecontroller.posts.length ,
                    itemBuilder:(context,i){
                      return  requestCard(
                          comandecontroller.posts[i]["addresse"],
                          21,
                          2000,
                          "images/users/ranpo.jpg",
                          2,
                          "assets/images/users/ranpo.jpg",comandecontroller.posts[i]["imageUri"]);
                    })
              ],
            ),

            // *** end filters
          ),
        ],
      ),
    )) ,
        ),
      ),
    );
  }
}
