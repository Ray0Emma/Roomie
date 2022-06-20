import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget adressepost(String adresse,int age ,String ville){
  return  Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(adresse,style: TextStyle(fontSize:13,fontWeight: FontWeight.w800 ),),
SizedBox(height: 20,),
Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
Text("${age} Personne"),Text(ville)
],)
],
);}