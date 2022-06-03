// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
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
    // return Scaffold(
    //   bottomNavigationBar: MotionTabBar(
    //     labels: ["Home", "New Request", "Maps", "Profile"],
    //     initialSelectedTab: "Home",
    //     tabIconColor: Color(0xff3A3A3B),
    //     tabSelectedColor: Color(0xff4943F0),
    //     onTabItemSelected: (int value) {
    //       print(value);
    //       setState(() {
    //         _tabController.index = value;
    //       });
    //     },
    //     icons: [Icons.home, Icons.add, Icons.map_outlined, Icons.person],
    //     textStyle: TextStyle(color: Color(0xff3A3A3B)),
    //   ),
    //   body: TabBarView(
    //     controller: _tabController,
    //     children: <Widget>[
    //       Container(
    //         child: Center(
    //           child: HomePage(),
    //         ),
    //       ),
    //       Container(
    //         child: Center(
    //           child: Text("New Request"),
    //         ),
    //       ),
    //       Container(
    //         child: Center(
    //           child: Text("Maps"),
    //         ),
    //       ),
    //       Container(
    //         child: Center(
    //           child: Text("Profile"),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
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
