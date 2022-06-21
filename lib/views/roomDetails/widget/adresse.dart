import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget adressepost(String adresse,String capacity ,String ville){
  return  Container(
    margin: EdgeInsets.symmetric(vertical: 18),
    child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(adresse,style: TextStyle(fontSize:13,fontWeight: FontWeight.w800 ),),
SizedBox(height: 20,),
Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
Text("${capacity} Personne"),Text("${ville}")
],)
],
),
  );}