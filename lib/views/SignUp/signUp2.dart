// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables

import 'dart:io';
import 'dart:io' as io;

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:roomie/resources/firebase_auth_constants.dart';
import 'package:roomie/views/SignUp/signUp3.dart';

import '../../resources/app_colors.dart';

class SignUp2 extends StatefulWidget {
  const SignUp2({Key? key}) : super(key: key);
  @override
  State<SignUp2> createState() => _SignUp2State();
}

class _SignUp2State extends State<SignUp2> {
  // late File _image;
  io.File? _image;
  final picker = ImagePicker();
  String? selectedcnieliv;
  List listGender = ["Gender", "male", "female"];
  TextEditingController image = TextEditingController();
  TextEditingController dateinput = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController textAbout = TextEditingController();
  @override
  void initState() {
    _image = io.File('assets/images/users/ranpo.jpg');
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formState = GlobalKey<FormState>();
    send() async {
      var formdata = formState.currentState;
      if (formdata!.validate()) {
        var imageurl;

        await authController
            .uploadFile(_image, context)
            .then((value) => imageurl = value);
        authController.fillProfile(imageurl, dateinput.text, phone.text,
            selectedcnieliv, textAbout.text);
        print("hiii imgae");
        print(imageurl);
        Get.to(SignUp3());
      } else {
        print("error");
      }
    }

    Future getImage() async {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      setState(() {
        _image = io.File(pickedFile!.path);
      });
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
                      size: 40,
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
                          Container(
                            width: 150,
                            height: 150,
                            child: InkWell(
                              onTap: getImage,
                              child: CircleAvatar(
                                // backgroundColor: Colors.grey,
                                backgroundImage: (_image == null)
                                    ? Image.file(
                                        _image!,
                                        fit: BoxFit.cover,
                                      ).image
                                    : AssetImage(
                                        'assets/images/users/ranpo.jpg'),
                                // child: Icon(
                                //   Icons.person,
                                //   color: Colors.white,
                                //   size: 100,
                                // )
                              ),
                            ),
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
                                    height: 20,
                                  ),
                                  Container(
                                      child: Center(
                                          child: TextFormField(
                                    controller: dateinput,
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          borderSide: BorderSide(
                                              color: AppColors.PRIMARY_COLOR,
                                              width: 2),
                                        ),
                                        hintText: "Enter Date",
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          borderSide: BorderSide(
                                              color: AppColors.PRIMARY_COLOR,
                                              width: 2),
                                        ),
                                        suffixIcon: Icon(
                                          Icons.calendar_today,
                                          //  color: _focusNodes[0].hasFocus ? AppColors.PRIMARY_COLOR: Colors.grey,
                                        )),
                                    readOnly:
                                        true, //set it true, so that user will not able to edit text
                                    onTap: () async {
                                      DateTime? pickedDate =
                                          await showDatePicker(
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
                                  ))),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
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
                                          isExpanded: true,
                                          iconSize: 40,
                                          iconEnabledColor:
                                              AppColors.PRIMARY_COLOR,
                                          iconDisabledColor:
                                              AppColors.PRIMARY_COLOR,
                                          value: selectedcnieliv,
                                          items: listGender.map((list) {
                                            return DropdownMenuItem<String>(
                                                value: list[0],
                                                child: Text("      " + list,
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                    )));
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
                                        return "phone number must be > 10 caracters";
                                      } else
                                        return null;
                                    },
                                    //   focusNode: _focusNodes[0],

                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          borderSide: BorderSide(
                                              color: AppColors.PRIMARY_COLOR,
                                              width: 2),
                                        ),
                                        hintText: "Your Phone",
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          borderSide: BorderSide(
                                              color: AppColors.PRIMARY_COLOR,
                                              width: 2),
                                        ),
                                        prefixIcon: Icon(
                                          Icons.phone,
                                          //  color: _focusNodes[0].hasFocus ? AppColors.PRIMARY_COLOR: Colors.grey,
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
                                      } else
                                        return null;
                                    },
                                    //   focusNode: _focusNodes[0],
                                    controller: textAbout,
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: BorderSide(
                                              color: AppColors.PRIMARY_COLOR,
                                              width: 2),
                                        ),
                                        hintText: "A little About You",
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: BorderSide(
                                              color: AppColors.PRIMARY_COLOR,
                                              width: 2),
                                        ),
                                        prefixIcon: Icon(
                                          Icons.text_fields,
                                          //  color: _focusNodes[0].hasFocus ? AppColors.PRIMARY_COLOR: Colors.grey,
                                        )),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      send();

                                      //  print(emailController.text);
                                      //  print(passwordController.text);
                                      // signin();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: AppColors.PRIMARY_COLOR,
                                      shape: StadiumBorder(),
                                      padding:
                                          EdgeInsets.symmetric(vertical: 16),
                                    ),
                                    child: Text(
                                      "Continue",
                                      style: TextStyle(fontSize: 20),
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
