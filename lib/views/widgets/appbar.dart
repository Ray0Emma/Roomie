// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
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
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    // color: Colors.blueAccent,
                    border: Border.all(
                        color: Color.fromARGB(255, 224, 224, 224), width: 4),
                    image: DecorationImage(
                        image: AssetImage("assets/images/users/user1.jpg"),
                        fit: BoxFit.cover)),
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: const [
                    Text(
                      "Roomie",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      "Find your next roommate",
                      style: TextStyle(color: Color.fromRGBO(217, 217, 217, 1)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SearchBar(),
      ],
    );
  }
}
