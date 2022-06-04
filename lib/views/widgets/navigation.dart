// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, import_of_legacy_library_into_null_safe, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:roomie/views/home.dart';

// optional, only if using provided badge style
// import 'package:motion_tab_bar_v2/motion-badge.widget.dart';

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({Key? key}) : super(key: key);

  @override
  State<MyNavigationBar> createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar>
    with TickerProviderStateMixin {
  int selectedIndex = 0;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 1, length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        unselectedItemColor: Color(0xff3A3A3B),
        selectedItemColor: Color(0xff30816F),
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: "New Request", icon: Icon(Icons.add_circle)),
          BottomNavigationBarItem(
              label: "Near Me", icon: Icon(Icons.location_on)),
          BottomNavigationBarItem(label: "Profile", icon: Icon(Icons.person)),
        ]);
  }
}
