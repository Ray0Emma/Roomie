// ignore_for_file: prefer_const_constructors, camel_case_types, must_be_immutable, prefer_interpolation_to_compose_strings

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:roomie/resources/app_styles.dart';
import 'package:roomie/views/Home/widgets/navigation.dart';
import '../../controllers/commandeController.dart';
import '../../resources/app_colors.dart';
import 'dart:io' as io;

import '../models/PostModel.dart';

class command extends StatefulWidget {
  comandeContrller c = Get.find();

  command({Key? key}) : super(key: key);

  @override
  State<command> createState() => _commandState();
}

class _commandState extends State<command> {
  comandeContrller c = Get.find();

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formState = GlobalKey<FormState>();
    send() async {
      var formdata = formState.currentState;
      if (formdata != null) {
        if (formdata.validate()) {
        } else {
          print("error");
        }
      }
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<comandeContrller>(
            builder: (comandecontroller) => Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Stack(
                                  children: <Widget>[
                                    Container(
                                      width: double.infinity,
                                      height: 200,
                                      color: Colors.black12,
                                      child: comandecontroller.image == null
                                          ? Icon(
                                              Icons.image,
                                              size: 50,
                                              color: Colors.white,
                                            )
                                          : Image.file(
                                              comandecontroller.image!,
                                              fit: BoxFit.fill,
                                            ),
                                    ),
                                    Positioned(
                                      right: 20,
                                      top: 20,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: AppColors.PRIMARY_COLOR,
                                          border: Border.all(
                                            color: AppColors.PRIMARY_COLOR,
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        width: 40,
                                        height: 40,
                                        child: Center(
                                            child: IconButton(
                                          icon: Icon(
                                            Icons.upload_file,
                                            color: Colors.white,
                                          ),
                                          onPressed: () async {
                                            comandecontroller
                                                .getImage(context)
                                                .then((file) {
                                              setState(() {
                                                comandecontroller.image =
                                                    io.File(file.path);
                                              });
                                              print(comandecontroller.image);
                                            });
                                          },
                                        )),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 27,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Column(
                                              children: [
                                                Text("Budget:"),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                TextFormField(
                                                  controller:
                                                      comandecontroller.budget,
                                                  inputFormatters: [
                                                    FilteringTextInputFormatter
                                                        .digitsOnly
                                                  ],
                                                  validator: (value) {
                                                    if (value!.isEmpty) {
                                                      return "the budget shouldn't be null";
                                                    } else {
                                                      return null;
                                                    }
                                                  },
                                                  decoration: InputDecoration(
                                                    enabledBorder:
                                                        enabledBorder,
                                                    focusedBorder:
                                                        focusedBorder,
                                                    focusedErrorBorder:
                                                        errorBorder,
                                                    errorBorder: errorBorder,
                                                    hintText: "   Budget",
                                                    // prefixIcon: Icon(
                                                    //   Icons.monetization_on,
                                                    // )
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 30,
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: Column(
                                              children: [
                                                Text("Capacity:"),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                        flex: 2,
                                                        child: Container(
                                                          height: 60,
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      10),
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                              color: AppColors
                                                                  .PRIMARY_COLOR,
                                                              width: 1.5,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            50)),
                                                          ),
                                                          child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceAround,
                                                              children: [
                                                                Expanded(
                                                                    flex: 1,
                                                                    child: Center(
                                                                        child: InkWell(
                                                                      onTap:
                                                                          () {
                                                                        comandecontroller
                                                                            .incrimenter();
                                                                      },
                                                                      child:
                                                                          Text(
                                                                        "+",
                                                                        style: TextStyle(
                                                                            color: AppColors
                                                                                .PRIMARY_COLOR,
                                                                            fontSize:
                                                                                30,
                                                                            fontWeight:
                                                                                FontWeight.w400),
                                                                      ),
                                                                    ))),
                                                                SizedBox(
                                                                    width: 10),
                                                                Expanded(
                                                                  flex: 3,
                                                                  child: Container(
                                                                      alignment: Alignment.center,
                                                                      height: double.infinity,
                                                                      decoration: BoxDecoration(
                                                                        border: Border.symmetric(
                                                                            vertical: BorderSide(
                                                                          color:
                                                                              AppColors.PRIMARY_COLOR,
                                                                          width:
                                                                              1.5,
                                                                        )),
                                                                      ),
                                                                      child: Text(
                                                                        "${comandecontroller.capacitycounter}",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                20,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            color: AppColors.BLACK_COLOR),
                                                                      )),
                                                                ),
                                                                SizedBox(
                                                                    width: 10),
                                                                Expanded(
                                                                    flex: 1,
                                                                    child: Center(
                                                                        child: InkWell(
                                                                            onTap: () {
                                                                              comandecontroller.dincrimenter();
                                                                            },
                                                                            child: Text(
                                                                              "-",
                                                                              style: TextStyle(color: AppColors.PRIMARY_COLOR, fontSize: 50, fontWeight: FontWeight.w400),
                                                                            ))))
                                                              ]),
                                                        )),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 14,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: AppColors.PRIMARY_COLOR,
                                            width: 1.5,
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50)),
                                        ),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton<String>(
                                              hint: Text("    City",
                                                  style: TextStyle()),
                                              isExpanded: true,
                                              iconSize: 40,
                                              iconEnabledColor:
                                                  AppColors.PRIMARY_COLOR,
                                              iconDisabledColor:
                                                  AppColors.PRIMARY_COLOR,
                                              value: comandecontroller
                                                  .selectedcnieliv,
                                              items: citys.map((list) {
                                                return DropdownMenuItem<String>(
                                                    value: list,
                                                    child: Text(
                                                        "       " + list,
                                                        style: TextStyle()));
                                              }).toList(),
                                              onChanged: (value) => setState(
                                                  () => comandecontroller
                                                          .selectedcnieliv =
                                                      value!)),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 2),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: AppColors.PRIMARY_COLOR,
                                            width: 1.5,
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                        ),
                                        child: MultiSelectFormField(
                                          fillColor: Colors.transparent,
                                          border: InputBorder.none,
                                          autovalidate: AutovalidateMode
                                              .onUserInteraction,
                                          chipBackGroundColor:
                                              AppColors.PRIMARY_COLOR,
                                          chipLabelStyle: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                          dialogTextStyle: TextStyle(
                                              fontWeight: FontWeight.bold),
                                          checkBoxActiveColor:
                                              AppColors.PRIMARY_COLOR,
                                          checkBoxCheckColor: Colors.white,
                                          dialogShapeBorder:
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              12.0))),
                                          title: Text(
                                            "Equipments",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: AppColors.PRIMARY_COLOR,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          validator: (value) {
                                            if (value == null ||
                                                value.length == 0) {
                                              return 'Please select one or more options';
                                            }
                                            return null;
                                          },
                                          dataSource: equipment,
                                          textField: 'display',
                                          valueField: 'value',
                                          okButtonLabel: 'OK',
                                          cancelButtonLabel: 'CANCEL',
                                          hintWidget:
                                              Text('Please choose one or more'),
                                          initialValue:
                                              comandecontroller.Equipment,
                                          onSaved: (value) {
                                            if (value == null) return;
                                            setState(() {
                                              comandecontroller.Equipment =
                                                  value;
                                            });
                                          },
                                        ),
                                      ),
                                      SizedBox(height: 12),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 2),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: AppColors.PRIMARY_COLOR,
                                            width: 1.5,
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                        ),
                                        child: MultiSelectFormField(
                                          fillColor: Colors.transparent,
                                          border: InputBorder.none,
                                          autovalidate: AutovalidateMode
                                              .onUserInteraction,
                                          chipBackGroundColor:
                                              AppColors.PRIMARY_COLOR,
                                          chipLabelStyle: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                          dialogTextStyle: TextStyle(
                                              fontWeight: FontWeight.bold),
                                          checkBoxActiveColor:
                                              AppColors.PRIMARY_COLOR,
                                          checkBoxCheckColor: Colors.white,
                                          dialogShapeBorder:
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              12.0))),
                                          title: Text(
                                            "Regulations",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: AppColors.PRIMARY_COLOR,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          validator: (value) {
                                            if (value == null ||
                                                value.length == 0) {
                                              return 'Please select one or more options';
                                            }
                                            return null;
                                          },
                                          dataSource: regulation,
                                          textField: 'display',
                                          valueField: 'value',
                                          okButtonLabel: 'OK',
                                          cancelButtonLabel: 'CANCEL',
                                          hintWidget:
                                              Text('Please choose one or more'),
                                          initialValue:
                                              comandecontroller.Regulation,
                                          onSaved: (value) {
                                            if (value == null) return;
                                            setState(() {
                                              comandecontroller.Regulation =
                                                  value;
                                            });
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      TextFormField(
                                        controller: comandecontroller.Addresse,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "please fill the field";
                                          } else {
                                            return null;
                                          }
                                        },
                                        decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              borderSide: BorderSide(
                                                  color:
                                                      AppColors.PRIMARY_COLOR,
                                                  width: 1.5),
                                            ),
                                            hintText: "Your Adresse",
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              borderSide: BorderSide(
                                                  color:
                                                      AppColors.PRIMARY_COLOR,
                                                  width: 1.5),
                                            ),
                                            suffixIcon: Icon(
                                              Icons.location_on,
                                            )),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      ElevatedButton(
                                        onPressed: () async {
                                          send();
                                          comandecontroller
                                              .addcommande(context);
                                          comandecontroller.getData();
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: AppColors.PRIMARY_COLOR,
                                          shape: StadiumBorder(),
                                          padding: EdgeInsets.symmetric(
                                              vertical: 16),
                                        ),
                                        child: (comandecontroller
                                                .currentPosts.isEmpty)
                                            ? Text(
                                                "Post",
                                                style: TextStyle(fontSize: 20),
                                              )
                                            : Text(
                                                "Update",
                                                style: TextStyle(fontSize: 20),
                                              ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          (comandecontroller
                                                  .currentPosts.isNotEmpty)
                                              ? Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  children: [
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    ElevatedButton(
                                                      onPressed: () async {
                                                        setState(() {
                                                          FirebaseFirestore
                                                              .instance
                                                              .collection(
                                                                  "posts")
                                                              .doc(FirebaseAuth
                                                                  .instance
                                                                  .currentUser!
                                                                  .uid)
                                                              .delete()
                                                              .then(
                                                                (doc) => [
                                                                  Get.offAll(
                                                                      MyNavigationBar()),
                                                                  comandecontroller
                                                                      .initialState(),
                                                                  comandecontroller
                                                                      .getData(),
                                                                ],
                                                                onError: (e) =>
                                                                    print(
                                                                        "Error updating document $e"),
                                                              );
                                                          print(comandecontroller
                                                              .currentPosts);
                                                          setState(() {});
                                                        });
                                                      },
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              elevation: 0,
                                                              primary: AppColors
                                                                  .RED_COLOR
                                                                  .withOpacity(
                                                                      .2),
                                                              shape:
                                                                  StadiumBorder(),
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          16),
                                                              side: BorderSide(
                                                                width: 1.5,
                                                                color: AppColors
                                                                    .RED_COLOR,
                                                              )),
                                                      child: Text(
                                                        "Delete",
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color: AppColors
                                                                .RED_COLOR),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                  ],
                                                )
                                              : Container(),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
      ),
    );
  }
}
