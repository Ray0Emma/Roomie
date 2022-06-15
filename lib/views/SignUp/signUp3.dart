// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roomie/resources/firebase_auth_constants.dart';
import 'package:roomie/views/Home/widgets/navigation.dart';

import '../../resources/app_colors.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';

class SignUp3 extends StatefulWidget {
  const SignUp3({Key? key}) : super(key: key);
  @override
  _SignUp3State createState() => _SignUp3State();
}

class _SignUp3State extends State<SignUp3> {
  List? _myLanguages, _myLifeStyle, _myPersonality, _myHobbis;
  Color selectedColor = AppColors.GRAY_Forced,
      selectedColor2 = AppColors.GRAY_Forced,
      selectedColor3 = AppColors.GRAY_Forced;
  String? status;
  List? listLanguages = [
    {
      "display": "Arabic",
      "value": "Arabic",
    },
    {
      "display": "English",
      "value": "English",
    },
    {
      "display": "French",
      "value": "French",
    },
    {
      "display": "German",
      "value": "German",
    },
    {
      "display": "Chinese",
      "value": "Chinese",
    },
    {
      "display": "Spanish",
      "value": "Spanish",
    },
    {
      "display": "Japanese",
      "value": "Japanese",
    },
  ];
  TextEditingController dateinput = TextEditingController();
  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
    _myLanguages = [];
    _myLifeStyle = [];
    _myPersonality = [];
    _myHobbis = [];
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formState = new GlobalKey<FormState>();
    send() {
      var formdata = formState.currentState;
      if (formdata!.validate()) {
        authController.addInfo(
            status, _myLanguages, _myLifeStyle, _myPersonality, _myHobbis);
        var snackBar = SnackBar(
          /// need to set following properties for best effect of awesome_snackbar_content
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            title: 'Welcome!',
            message: 'You have filled you profile informations successfully!',

            /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
            contentType: ContentType.success,
          ),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Get.to(MyNavigationBar());
      } else {
        print("error");
      }
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.PRIMARY_COLOR,
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 9, horizontal: 30),
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                      color: Colors.white,
                    ),
                    Text(
                      "Fill Profile",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 40),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Expanded(
                child: Container(
                    padding: EdgeInsets.all(30),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30))),
                    child: SingleChildScrollView(
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(0),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: selectedColor, width: 2),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(200))),
                                    child: CircleAvatar(
                                        radius: 34,
                                        backgroundColor:
                                            selectedColor.withOpacity(0.3),
                                        child: Container(
                                            child: IconButton(
                                          icon: Icon(
                                            Icons.school,
                                            color: selectedColor,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              if (selectedColor ==
                                                  AppColors.GRAY_Forced) {
                                                selectedColor =
                                                    AppColors.PRIMARY_COLOR;
                                              } else {
                                                selectedColor =
                                                    AppColors.GRAY_Forced;
                                              }

                                              status = "Student";
                                            });
                                          },
                                        ))),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Student",
                                    style: TextStyle(
                                        color: selectedColor,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(0),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: selectedColor2, width: 2),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(200))),
                                    child: CircleAvatar(
                                        radius: 34,
                                        backgroundColor:
                                            selectedColor2.withOpacity(0.3),
                                        child: Container(
                                            child: IconButton(
                                          icon: Icon(
                                            Icons.card_travel,
                                            color: selectedColor2,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              if (selectedColor2 ==
                                                  AppColors.GRAY_Forced) {
                                                selectedColor2 =
                                                    AppColors.PRIMARY_COLOR;
                                              } else {
                                                selectedColor2 =
                                                    AppColors.GRAY_Forced;
                                              }
                                              status = "Professional";
                                            });
                                          },
                                        ))),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Professional",
                                    style: TextStyle(
                                        color: selectedColor2,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: selectedColor3, width: 2),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(200))),
                                    child: CircleAvatar(
                                        radius: 34,
                                        backgroundColor:
                                            selectedColor3.withOpacity(0.3),
                                        child: Container(
                                            child: IconButton(
                                          icon: Icon(
                                            Icons.computer,
                                            color: selectedColor3,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              if (selectedColor3 ==
                                                  AppColors.GRAY_Forced) {
                                                selectedColor3 =
                                                    AppColors.PRIMARY_COLOR;
                                              } else {
                                                selectedColor3 =
                                                    AppColors.GRAY_Forced;
                                              }

                                              status = "FreeLancer";
                                            });
                                          },
                                        ))),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "FreeLancer",
                                    style: TextStyle(
                                        color: selectedColor3,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Form(
                              key: formState,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  SizedBox(
                                    height: 40,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: AppColors.PRIMARY_COLOR,
                                        width: 2,
                                      ),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(50)),
                                    ),
                                    child: MultiSelectFormField(
                                      border: InputBorder.none,
                                      fillColor: Colors.transparent,
                                      autovalidate: AutovalidateMode.disabled,
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
                                      dialogShapeBorder: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12.0))),
                                      title: Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 8, right: 8, left: 8),
                                        child: Text(
                                          "Languages",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: AppColors.PRIMARY_COLOR,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null ||
                                            value.length == 0) {
                                          return 'Please select one or more options';
                                        }
                                        return null;
                                      },
                                      dataSource: listLanguages,
                                      textField: 'display',
                                      valueField: 'value',
                                      okButtonLabel: 'OK',
                                      cancelButtonLabel: 'CANCEL',
                                      hintWidget: Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 8, right: 8, left: 8),
                                        child:
                                            Text('Please choose one or more'),
                                      ),
                                      initialValue: _myLanguages,
                                      onSaved: (value) {
                                        if (value == null) return;
                                        setState(() {
                                          _myLanguages = value;
                                        });
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: AppColors.PRIMARY_COLOR,
                                        width: 2,
                                      ),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(50)),
                                    ),
                                    child: MultiSelectFormField(
                                      border: InputBorder.none,
                                      fillColor: Colors.transparent,
                                      autovalidate: AutovalidateMode.disabled,
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
                                      dialogShapeBorder: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12.0))),
                                      title: Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 8, right: 8, left: 8),
                                        child: Text(
                                          "Personality",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: AppColors.PRIMARY_COLOR,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null ||
                                            value.length == 0) {
                                          return 'Please select one or more options';
                                        }
                                        return null;
                                      },
                                      dataSource: listLanguages,
                                      textField: 'display',
                                      valueField: 'value',
                                      okButtonLabel: 'OK',
                                      cancelButtonLabel: 'CANCEL',
                                      hintWidget: Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 8, right: 8, left: 8),
                                        child:
                                            Text('Please choose one or more'),
                                      ),
                                      initialValue: _myPersonality,
                                      onSaved: (value) {
                                        if (value == null) return;
                                        setState(() {
                                          _myPersonality = value;
                                        });
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: AppColors.PRIMARY_COLOR,
                                        width: 2,
                                      ),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(50)),
                                    ),
                                    child: MultiSelectFormField(
                                      border: InputBorder.none,
                                      fillColor: Colors.transparent,
                                      autovalidate: AutovalidateMode.disabled,
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
                                      dialogShapeBorder: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12.0))),
                                      title: Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 8, right: 8, left: 8),
                                        child: Text(
                                          "LifeStyle",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: AppColors.PRIMARY_COLOR,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null ||
                                            value.length == 0) {
                                          return 'Please select one or more options';
                                        }
                                        return null;
                                      },
                                      dataSource: listLanguages,
                                      textField: 'display',
                                      valueField: 'value',
                                      okButtonLabel: 'OK',
                                      cancelButtonLabel: 'CANCEL',
                                      hintWidget: Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 8, right: 8, left: 8),
                                        child:
                                            Text('Please choose one or more'),
                                      ),
                                      initialValue: _myLifeStyle,
                                      onSaved: (value) {
                                        if (value == null) return;
                                        setState(() {
                                          _myLifeStyle = value;
                                        });
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: AppColors.PRIMARY_COLOR,
                                        width: 2,
                                      ),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(50)),
                                    ),
                                    child: MultiSelectFormField(
                                      border: InputBorder.none,
                                      fillColor: Colors.transparent,
                                      autovalidate: AutovalidateMode.disabled,
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
                                      dialogShapeBorder: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12.0))),
                                      title: Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 8, right: 8, left: 8),
                                        child: Text(
                                          "Hobbis",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: AppColors.PRIMARY_COLOR,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null ||
                                            value.length == 0) {
                                          return 'Please select one or more options';
                                        }
                                        return null;
                                      },
                                      dataSource: listLanguages,
                                      textField: 'display',
                                      valueField: 'value',
                                      okButtonLabel: 'OK',
                                      cancelButtonLabel: 'CANCEL',
                                      hintWidget: Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 8, right: 8, left: 8),
                                        child:
                                            Text('Please choose one or more'),
                                      ),
                                      initialValue: _myHobbis,
                                      onSaved: (value) {
                                        if (value == null) return;
                                        setState(() {
                                          _myHobbis = value;
                                        });
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      send();
                                    },
                                    child: Text(
                                      "Save",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      primary: AppColors.PRIMARY_COLOR,
                                      shape: StadiumBorder(),
                                      padding:
                                          EdgeInsets.symmetric(vertical: 16),
                                    ),
                                  ),
                                ],
                              )),
                          // _forgotPassword(context),
                          // _signup(context),
                        ],
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
