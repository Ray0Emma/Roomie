
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

Widget characher(String adresse,List lang){
  return  Container(
    margin: EdgeInsets.symmetric(vertical: 12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(adresse,style: TextStyle(fontSize:16,fontWeight: FontWeight.w900 ),),
        SizedBox(height: 17,),
        SizedBox(
          height: 26,
          child: ListView.builder(
           //   shrinkWrap: true,
              scrollDirection:Axis.horizontal ,
              physics: BouncingScrollPhysics(),
             // padding: EdgeInsets.symmetric(horizontal: 15),
              itemCount:lang.length,
              itemBuilder:(context,i){
                return    Container(margin: EdgeInsets.only(right: 5),child: Text("${lang[i]}"+","),);
              }),
        )
      ],
    ),
  );

}