// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../resources/app_colors.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';

class SignUp3 extends StatefulWidget {
  const SignUp3({Key? key}) : super(key: key);
  @override
  _SignUp3State createState() => _SignUp3State();
}

class _SignUp3State extends State<SignUp3> {
  List? _myActivities;
  String? selectedcnieliv1;
  String? selectedcnieliv2;
  String? selectedcnieliv3;
  String? selectedcnieliv4;
  List listGender = ["Gender", "farah", "rachid", "bourigue", "hamadi"];
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
    _myActivities = [];
  }

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formState = new GlobalKey<FormState>();
    send() {
      var formdata = formState.currentState;
      if (formdata!.validate()) {
        print("sdfgh");
      } else {
        print("hello");
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
                                            color: AppColors.PRIMARY_COLOR,
                                            width: 2),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(200))),
                                    child: CircleAvatar(
                                        radius: 34,
                                        backgroundColor: AppColors.PRIMARY_COLOR
                                            .withOpacity(0.3),
                                        child: Container(
                                            child: Icon(
                                          Icons.school,
                                          color: AppColors.PRIMARY_COLOR,
                                          size: 50,
                                        ))),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Student",
                                    style: TextStyle(
                                        color: AppColors.PRIMARY_COLOR,
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
                                            color: AppColors.GRAY_Forced,
                                            width: 2),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(200))),
                                    child: CircleAvatar(
                                        radius: 34,
                                        backgroundColor: Colors.white,
                                        child: Container(
                                            child: Icon(
                                          Icons.card_travel,
                                          color: AppColors.GRAY_Forced,
                                          size: 50,
                                        ))),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Professional",
                                    style: TextStyle(
                                        color: AppColors.GRAY_Forced,
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
                                            color: AppColors.GRAY_Forced,
                                            width: 2),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(200))),
                                    child: CircleAvatar(
                                        radius: 34,
                                        backgroundColor: Colors.white,
                                        child: Container(
                                            child: Icon(
                                          Icons.computer,
                                          color: AppColors.GRAY_Forced,
                                          size: 50,
                                        ))),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "FreeLancer",
                                    style: TextStyle(
                                        color: AppColors.GRAY_Forced,
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
                                      initialValue: _myActivities,
                                      onSaved: (value) {
                                        if (value == null) return;
                                        setState(() {
                                          _myActivities = value;
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
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                          hint: Text("      " + listGender[0]),
                                          isExpanded: true,
                                          iconSize: 40,
                                          iconEnabledColor:
                                              AppColors.PRIMARY_COLOR,
                                          iconDisabledColor:
                                              AppColors.PRIMARY_COLOR,
                                          value: selectedcnieliv2,
                                          items: listGender.map((list) {
                                            return DropdownMenuItem<String>(
                                                value: list[0],
                                                child: Text("      " + list,
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                    )));
                                          }).toList(),
                                          onChanged: (value) => setState(
                                              () => selectedcnieliv2 = value!)),
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
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                          hint: Text("      " + listGender[0]),
                                          isExpanded: true,
                                          iconSize: 40,
                                          iconEnabledColor:
                                              AppColors.PRIMARY_COLOR,
                                          iconDisabledColor:
                                              AppColors.PRIMARY_COLOR,
                                          value: selectedcnieliv3,
                                          items: listGender.map((list) {
                                            return DropdownMenuItem<String>(
                                                value: list[0],
                                                child: Text("      " + list,
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                    )));
                                          }).toList(),
                                          onChanged: (value) => setState(
                                              () => selectedcnieliv3 = value!)),
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
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                          hint: Text("      " + listGender[0]),
                                          isExpanded: true,
                                          iconSize: 40,
                                          iconEnabledColor:
                                              AppColors.PRIMARY_COLOR,
                                          iconDisabledColor:
                                              AppColors.PRIMARY_COLOR,
                                          value: selectedcnieliv4,
                                          items: listGender.map((list) {
                                            return DropdownMenuItem<String>(
                                                value: list[0],
                                                child: Text("      " + list,
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                    )));
                                          }).toList(),
                                          onChanged: (value) => setState(
                                              () => selectedcnieliv4 = value!)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      send();

                                      //  print(emailController.text);
                                      //  print(passwordController.text);
                                      // signin();
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
