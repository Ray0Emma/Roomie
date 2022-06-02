// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({Key? key}) : super(key: key);

  @override
  State<MyNavigationBar> createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        unselectedItemColor: Color(0xff3A3A3B),
        selectedItemColor: Color(0xff4943F0),
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: "New Request", icon: Icon(Icons.add)),
          BottomNavigationBarItem(label: "Maps", icon: Icon(Icons.map)),
          BottomNavigationBarItem(label: "Profile", icon: Icon(Icons.person)),
        ]);
  }
}
