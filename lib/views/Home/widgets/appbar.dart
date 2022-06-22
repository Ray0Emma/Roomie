// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:roomie/controllers/userController.dart';
import 'package:roomie/resources/app_colors.dart';
import '../widgets/searchBar.dart';

class MyAppBar extends StatefulWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Stack(
            //  Stack places the objects in the upper left corner
            children: <Widget>[
              FutureBuilder(
                future: UserController.instance.loadImage(),
                builder: (BuildContext context, AsyncSnapshot usnapshot) {
                  if (usnapshot.hasData &&
                      usnapshot.connectionState == ConnectionState.done &&
                      usnapshot.data["profile"] != null) {
                    return Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border:
                              Border.all(color: AppColors.GRAY_COLOR, width: 4),
                          image: DecorationImage(
                              image: NetworkImage(
                                  usnapshot.data["profile"]), //user profile
                              fit: BoxFit.cover)),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: const [
                    Text(
                      "Roomie",
                      style: TextStyle(
                        color: AppColors.PRIMARY_COLOR_LIGHT,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      "Find your next roommate",
                      style: TextStyle(color: AppColors.GRAY_COLOR),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

      ],
    );
  }
}
