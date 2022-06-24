// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:roomie/controllers/commandeController.dart';
import 'package:roomie/views/Home/widgets/appbar.dart';
import 'package:roomie/views/Home/widgets/request_card.dart';
import 'package:roomie/views/Home/widgets/filter.dart';
import 'package:roomie/resources/app_colors.dart';
import 'package:roomie/views/Home/widgets/searchBar.dart';

import '../../controllers/HomeController.dart';
import '../Home/widgets/filterNumber.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  homeController c = Get.find();
  String name = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: GetBuilder<homeController>(
              builder: (homecontroller) => Container(
                    decoration: BoxDecoration(
                      color: AppColors.PRIMARY_COLOR,
                    ),
                    child: Column(
                      children: [
                        // ****AppBar start****
                        MyAppBar(),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: AppColors.GRAY_COLOR),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    cursorColor: AppColors.PRIMARY_COLOR,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Search by city",
                                      contentPadding: EdgeInsets.all(20.0),
                                    ),
                                    keyboardType: TextInputType.text,
                                    maxLines: 1,
                                    onChanged: (value) {
                                      setState(() {
                                        name = value;
                                      });
                                    },
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.search,
                                    color: AppColors.PRIMARY_COLOR_DARK,
                                  ),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ),
                        ),
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
                              /* ListView.builder(
                                  shrinkWrap: true,
                                  physics: BouncingScrollPhysics(),
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  itemCount: homecontroller.posts.length,
                                  itemBuilder: (context, i) {
                                    return requestCard(
                                        homecontroller.users[i]["name"],
                                        homecontroller.calculateAge(
                                            homecontroller.users[i]
                                                ["birthday"]),
                                        homecontroller.posts[i]["budget"],
                                        "images",
                                        homecontroller.posts[i]["capacity"],
                                        homecontroller.users[i]
                                            ["profile"],
                                        homecontroller.posts[i]["imageUri"],
                                        homecontroller.posts[i]["id_user"]);
                                  })*/

                              StreamBuilder<QuerySnapshot>(
                                stream: (name != "" && name != null)
                                    ? FirebaseFirestore.instance
                                        .collection('posts')
                                        .where("city",
                                            isGreaterThanOrEqualTo:
                                                name.capitalizeFirst,
                                            isLessThan:
                                                '${name.capitalizeFirst}z')
                                        .snapshots()
                                    : FirebaseFirestore.instance
                                        .collection("posts")
                                        .snapshots(),
                                builder: (context, snapshot) {
                                  return (snapshot.connectionState ==
                                          ConnectionState.waiting)
                                      ? Center(
                                          child: CircularProgressIndicator())
                                      : ListView.builder(

                                    shrinkWrap: true,
                                    physics: BouncingScrollPhysics(),
                                    padding: EdgeInsets.symmetric(horizontal: 15),
                                    itemCount: snapshot.data!.docs.length,
                                    itemBuilder: (context, index) {

                                      DocumentSnapshot data = snapshot.data!.docs[index];
                                      return  requestCard(
                                          homecontroller.users[index]["name"],
                                          homecontroller.calculateAge(
                                              homecontroller.users[index]
                                              ["birthday"]),
                                          data["budget"],
                                          "images",
                                          data["capacity"],
                                          homecontroller.users[index]
                                          ["profile"],
                                          data["imageUri"],
                                          data["id_user"],
                                        data["addresse"],
                                      );

                                    },
                                  );

                                },
                              )
                              /*
                              FutureBuilder(
                                future: homecontroller.getAllDataPost(),
                                builder:
                                    (BuildContext context, AsyncSnapshot usnapshot) {
                                  if (usnapshot.hasData &&
                                      usnapshot.connectionState ==
                                          ConnectionState.done ) {
                                    return ListView.builder(
                                      shrinkWrap: true,
                                      physics: BouncingScrollPhysics(),
                                      padding: EdgeInsets.symmetric(horizontal: 15),
                                      itemCount: usnapshot.data.docs.length,
                                      itemBuilder: (context, index) {
                                        DocumentSnapshot data = usnapshot.data.docs[index];
                                        return Text("${data["addresse"]}");
                                      },
                                    );
                                  } else {
                                    return Container();
                                  }
                                },
                              )*/
                            ],
                          ),

                          // *** end filters
                        ),
                      ],
                    ),
                  )),
        ),
      ),
    );
  }
}
