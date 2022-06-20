import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget profileUser(String image,String name,String aboutme,String age,String etat){
  return  Container(
    margin: EdgeInsets.symmetric(vertical: 18),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Roommate",style: TextStyle(fontSize:13,fontWeight: FontWeight.w800 ),),
        SizedBox(height: 10,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  color: Colors.blueAccent,
                  image: DecorationImage(image:NetworkImage(image), fit: BoxFit.cover)),),
             SizedBox(width: 4,),
             Column(
               mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
               Text(name,style: TextStyle(fontWeight: FontWeight.w700),),SizedBox(height: 5),Text(aboutme,style: TextStyle(fontSize: 10),)
             ],),
            Text("${age} Years old",style: TextStyle(fontWeight:FontWeight.w500),)
          ],),
        SizedBox(height: 5,),
        Text("${etat}",style: TextStyle(fontWeight:FontWeight.w500),)

      ],
    ),
  );}