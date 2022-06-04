// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Color(0xffF5F7F9)),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                cursorColor: Color(0xff30816F),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search by city",
                  contentPadding: EdgeInsets.all(20.0),
                ),
                keyboardType: TextInputType.text,
                maxLines: 1,
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.search,
                color: Color(0xff7C7B90),
              ),
              onPressed: null,
            ),
          ],
        ),
      ),
    );
  }
}
