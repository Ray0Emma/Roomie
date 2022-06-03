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

  // static const TextStyle optionStyle =
  //     TextStyle(fontSize: 30, fontWeight: FontWeight.w600);

  // static List<Widget> _widgetOptions = <Widget>[
  //   HomePage(),
  //   // Text(
  //   //   'Home',
  //   //   style: optionStyle,
  //   // ),
  //   Text(
  //     'New Request',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Near Me',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Profile',
  //     style: optionStyle,
  //   ),
  // ];

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
          BottomNavigationBarItem(label: "New Request", icon: Icon(Icons.add)),
          BottomNavigationBarItem(
              label: "Near Me", icon: Icon(Icons.location_on)),
          BottomNavigationBarItem(label: "Profile", icon: Icon(Icons.person)),
        ]);
    // return Scaffold(
    //   backgroundColor: Color(0xff30816F),
    //   body: Center(
    //     child: _widgetOptions.elementAt(_selectedIndex),
    //   ),
    //   bottomNavigationBar: Container(
    //     decoration: BoxDecoration(
    //       color: Colors.white,
    //       boxShadow: [
    //         BoxShadow(
    //           blurRadius: 20,
    //           color: Colors.black.withOpacity(.1),
    //         )
    //       ],
    //     ),
    //     child: SafeArea(
    //       child: Padding(
    //         padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
    //         child: GNav(
    //           rippleColor: Colors.grey[300]!,
    //           hoverColor: Colors.grey[100]!,
    //           gap: 8,
    //           activeColor: Colors.white,
    //           iconSize: 24,
    //           padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    //           duration: Duration(milliseconds: 400),
    //           tabBackgroundColor: Color(0xff30816F),
    //           color: Color(0xff3a3a3b),
    //           tabs: [
    //             GButton(
    //               icon: Icons.home,
    //               text: 'Home',
    //             ),
    //             GButton(
    //               icon: Icons.add,
    //               text: 'New Request',
    //             ),
    //             GButton(
    //               icon: Icons.map,
    //               text: 'Near Me',
    //             ),
    //             GButton(
    //               icon: Icons.person,
    //               text: 'Profile',
    //             ),
    //           ],
    //           selectedIndex: _selectedIndex,
    //           onTabChange: (index) {
    //             setState(() {
    //               _selectedIndex = index;
    //             });
    //           },
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
