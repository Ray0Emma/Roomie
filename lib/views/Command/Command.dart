import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:roomie/controllers/commandeController.dart';
import '../../resources/app_colors.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io' as io;

import 'upload/storage.dart';

class command extends StatefulWidget {
  const command({Key? key}) : super(key: key);
  @override
  State<command> createState() => _commandState();
}

class _commandState extends State<command> {
  String? selectedcnieliv;
  List listGender = ["Gender", "farah", "rachid", "bourigue", "hamadi"];
  TextEditingController dateinput = TextEditingController();
  TextEditingController capacity = TextEditingController();

  @override
  void initState() {
    dateinput.text = "";
    capacity.text = "1";
    comandeContrller.instance.setInitialScreen();
    //set the initial value of text field
    super.initState();
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
        backgroundColor: Colors.white,
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Container(
                    child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: CircleAvatar(
                            child: Icon(
                              Icons.person_outline_rounded,
                              color: Colors.white,
                              size: 100,
                            ),
                            backgroundColor: Colors.grey),
                        width: 150,
                        height: 150,
                      ),
                      Form(
                          key: formState,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: TextFormField(
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      validator: (value) {
                                        if (value!.isEmpty ||
                                            value.length < 10) {
                                          return "the phone must be > 10 caracter";
                                        } else
                                          return null;
                                      },
                                      //   focusNode: _focusNodes[0],
                                      // controller: emailController,
                                      decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            borderSide: BorderSide(
                                                color: AppColors.PRIMARY_COLOR,
                                                width: 2),
                                          ),
                                          hintText: "Budjet",
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            borderSide: BorderSide(
                                                color: AppColors.PRIMARY_COLOR,
                                                width: 2),
                                          ),
                                          prefixIcon: Icon(
                                            Icons.money,
                                            //  color: _focusNodes[0].hasFocus ? AppColors.PRIMARY_COLOR: Colors.grey,
                                          )),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                            flex: 3,
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 30),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color:
                                                      AppColors.PRIMARY_COLOR,
                                                  width: 2,
                                                ),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(50)),
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
                                                        child: Text(
                                                          "+",
                                                          style: TextStyle(
                                                              fontSize: 30,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ),
                                                      ))),
                                                  SizedBox(width: 10),
                                                  Expanded(
                                                    flex: 3,
                                                    child: TextFormField(
                                                      controller: capacity,
                                                      validator: (value) {
                                                        if (value!.isEmpty ||
                                                            value.length < 10) {
                                                          return "the phone must be > 10 caracter";
                                                        } else
                                                          return null;
                                                      },
                                                      //   focusNode: _focusNodes[0],
                                                      // controller: emailController,
                                                      decoration:
                                                          InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets.all(
                                                                (23)),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: AppColors
                                                                  .PRIMARY_COLOR,
                                                              width: 2),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: AppColors
                                                                  .PRIMARY_COLOR,
                                                              width: 2),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 10),
                                                  Expanded(
                                                      flex: 1,
                                                      child: InkWell(
                                                          child: Center(
                                                              child: Text(
                                                        "-",
                                                        style: TextStyle(
                                                            fontSize: 50,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ))))
                                                ],
                                              ),
                                            )),
                                      ],
                                    ),
                                  )
                                ],
                              ),
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
                                      iconEnabledColor: AppColors.PRIMARY_COLOR,
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
                                      iconEnabledColor: AppColors.PRIMARY_COLOR,
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
                                      iconEnabledColor: AppColors.PRIMARY_COLOR,
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
                                validator: (value) {
                                  if (value!.isEmpty || value.length < 10) {
                                    return "the phone must be > 10 caracter";
                                  } else
                                    return null;
                                },
                                //   focusNode: _focusNodes[0],
                                // controller: emailController,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                      borderSide: BorderSide(
                                          color: AppColors.PRIMARY_COLOR,
                                          width: 2),
                                    ),
                                    hintText: "Your Adresse",
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                      borderSide: BorderSide(
                                          color: AppColors.PRIMARY_COLOR,
                                          width: 2),
                                    ),
                                    prefixIcon: Icon(
                                      Icons.location_city,
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
                                child: Text(
                                  "Post",
                                  style: TextStyle(fontSize: 20),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: AppColors.PRIMARY_COLOR,
                                  shape: StadiumBorder(),
                                  padding: EdgeInsets.symmetric(vertical: 16),
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

class uplodeimg extends StatefulWidget {
  @override
  _uplodeimgState createState() => _uplodeimgState();
}

class _uplodeimgState extends State<uplodeimg> {
  io.File? image;
  Storage _storage = new Storage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('upload one image'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 140,
                width: 180,
                color: Colors.black12,
                child: image == null
                    ? Icon(
                        Icons.image,
                        size: 50,
                      )
                    : Image.file(
                        image!,
                        fit: BoxFit.fill,
                      )),
            ElevatedButton(
                child: Text('pick image'),
                onPressed: () {
                  _storage.getImage(context).then((file) {
                    setState(() {
                      image = io.File(file.path);
                      print("file path ----------------" +
                          file.path +
                          "----------------");
                      print(image);
                    });
                  });
                }),
            TextButton(
                onPressed: () {
                  if (image != null) {
                    _storage.uploadFile(image!, context);

                    //  print(_storage.uploadFile(image!, context).toString());
                  } else
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("No Image was selected")));
                },
                child: Text('Upload Image'))
          ],
        ),
      ),
    );
  }
}
