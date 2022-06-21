// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables, unrelated_type_equality_checks, use_build_context_synchronously

import 'dart:io' as io;

import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:roomie/controllers/userController.dart';
import 'package:roomie/resources/app_styles.dart';
import 'package:roomie/resources/firebase_auth_constants.dart';
import 'package:roomie/views/Profile/widgets/profileImage.dart';
import 'package:roomie/views/SignUp/signUp3.dart';

import 'package:roomie/resources/app_colors.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);
  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  io.File? _image;
  final picker = ImagePicker();
  var imageurl;
  String? selectedcnieliv;
  List listGender = ["male", "female"];
  TextEditingController image = TextEditingController();
  TextEditingController dateinput = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController textAbout = TextEditingController();
  @override
  void initState() {
    super.initState();
    asyncTasks() async {
      await UserController.instance.getData().then((value) => {
            setState(() {
              (value != null)
                  ? [
                      dateinput.text = value['birthday'],
                      phone.text = value['phone'],
                      selectedcnieliv = value['gender'].toString(),
                      textAbout.text = value['about'],
                      imageurl = value['profile'],
                    ]
                  : CircularProgressIndicator();
            })
          });
    }

    setState(() {
      asyncTasks();
    });
    asyncTasks();
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formState = GlobalKey<FormState>();
    send() async {
      var formdata = formState.currentState;
      if (formdata!.validate()) {
        if (_image != null) {
          await authController
              .uploadFile(_image, context)
              .then((value) => imageurl = value);
          authController.fillProfile(imageurl, dateinput.text, phone.text,
              selectedcnieliv, textAbout.text, context);
        } else {
          authController.fillProfile(imageurl, dateinput.text, phone.text,
              selectedcnieliv, textAbout.text, context);
        }

        print(imageurl);
        Get.back();
      } else {
        print("error");
      }
    }

    Future getImage() async {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      setState(() {
        _image = io.File(pickedFile!.path);
        imageurl == null;
      });
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.PRIMARY_COLOR,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 11, horizontal: 30),
              child: Row(
                children: [
                  arrowBack(),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Edit Profile",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 28),
                  )
                ],
              ),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 150,
                          height: 150,
                          child: InkWell(
                            onTap: getImage,
                            child: CircleAvatar(
                              backgroundColor:
                                  AppColors.GRAY_Forced.withOpacity(0.3),
                              child: ClipOval(
                                child: SizedBox(
                                  width: 150.0,
                                  height: 150.0,
                                  child: (_image != null)
                                      ? Image.file(
                                          _image!,
                                          fit: BoxFit.cover,
                                        )
                                      : profileImage(),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Form(
                            key: formState,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Center(
                                    child: TextFormField(
                                  controller: dateinput,
                                  decoration: InputDecoration(
                                      hintText: "Enter Date",
                                      enabledBorder: enabledBorder,
                                      focusedBorder: focusedBorder,
                                      focusedErrorBorder: errorBorder,
                                      errorBorder: errorBorder,
                                      suffixIcon: Icon(
                                        Icons.calendar_month_rounded,
                                      )),
                                  readOnly:
                                      true, //set it true, so that user will not able to edit text
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(
                                            2000), //DateTime.now() - not to allow to choose before today.
                                        lastDate: DateTime(2101));

                                    if (pickedDate != null) {
                                      print(
                                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                      String formattedDate =
                                          DateFormat('yyyy-MM-dd')
                                              .format(pickedDate);
                                      print(
                                          formattedDate); //formatted date output using intl package =>  2021-03-16
                                      //you can implement different kind of Date Format here according to your requirement

                                      setState(() {
                                        dateinput.text =
                                            formattedDate; //set output date to TextField value.
                                      });
                                    } else {
                                      print("Date is not selected");
                                    }
                                  },
                                )),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AppColors.PRIMARY_COLOR,
                                      width: 1.5,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                        isExpanded: true,
                                        iconSize: 40,
                                        iconEnabledColor:
                                            AppColors.PRIMARY_COLOR,
                                        iconDisabledColor:
                                            AppColors.GRAY_Forced,
                                        hint: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('Gender'),
                                        ),
                                        value: selectedcnieliv,
                                        items: listGender.map((list) {
                                          return DropdownMenuItem<String>(
                                              value: list,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(9.0),
                                                child: Text(list,
                                                    style: TextStyle(
                                                      fontSize: 17,
                                                    )),
                                              ));
                                        }).toList(),
                                        onChanged: (value) => setState(
                                            () => selectedcnieliv = value!)),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  controller: phone,
                                  validator: (value) {
                                    if (value!.isEmpty || value.length < 10) {
                                      return "phone number must be 10 digits";
                                    } else {
                                      return null;
                                    }
                                  },
                                  //   focusNode: _focusNodes[0],

                                  decoration: InputDecoration(
                                      hintText: "Your Phone",
                                      enabledBorder: enabledBorder,
                                      focusedBorder: focusedBorder,
                                      focusedErrorBorder: errorBorder,
                                      errorBorder: errorBorder,
                                      suffixIcon: Icon(
                                        Icons.phone,
                                      )),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  maxLines: 3,
                                  validator: (value) {
                                    if (value!.isEmpty || value.length < 8) {
                                      return "tell us about you";
                                    } else {
                                      return null;
                                    }
                                  },
                                  //   focusNode: _focusNodes[0],
                                  controller: textAbout,
                                  decoration: InputDecoration(
                                      hintText: "A little About You",
                                      enabledBorder: enabledBorderAbout,
                                      focusedBorder: focusedBorderAbout,
                                      focusedErrorBorder: errorBorderAbout,
                                      errorBorder: errorBorderAbout,
                                      suffixIcon: Icon(
                                        Icons.text_fields,
                                      )),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    send();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: AppColors.PRIMARY_COLOR,
                                    shape: StadiumBorder(),
                                    padding: EdgeInsets.symmetric(vertical: 16),
                                  ),
                                  child: Text(
                                    "Update",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
