// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:roomie/resources/firebase_auth_constants.dart';
import 'package:roomie/views/SignUp/signUp2.dart';

import 'package:roomie/resources/app_colors.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formState = GlobalKey<FormState>();
    send() async {
      var formdata = formState.currentState;
      if (formdata!.validate()) {
        authController.register(_emailController.text.trim(),
            _passwordController.text.trim(), _nameController.text);

        // var user = await FirebaseAuth.instance.currentUser;
        // authController.addUser(user);
        var snackBar = SnackBar(
          /// need to set following properties for best effect of awesome_snackbar_content
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            title: 'Fill Profile!',
            message: 'Please fill in your profile informations!',

            /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
            contentType: ContentType.success,
          ),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Get.to(SignUp2());
      } else {
        var snackBar = SnackBar(
          /// need to set following properties for best effect of awesome_snackbar_content
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            title: 'Error!',
            message: 'Please fill all the fields!',

            /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
            contentType: ContentType.failure,
          ),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
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
                  Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Sign Up",
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
                          width: 200,
                          height: 200,
                          child: SvgPicture.asset(
                            "assets/images/login.svg",
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
                                  height: 30,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 8.0),
                                  child: TextFormField(
                                    cursorColor: AppColors.PRIMARY_COLOR,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "enter your Full Name  ";
                                      } else {
                                        return null;
                                      }
                                    },
                                    //   focusNode: _focusNodes[0],
                                    controller: _nameController,
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          borderSide: BorderSide(
                                              color: AppColors.PRIMARY_COLOR,
                                              width: 1.5),
                                        ),
                                        hintText: "Your Full Name",
                                        errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          borderSide: BorderSide(
                                              color: AppColors.RED_COLOR,
                                              width: 1.5),
                                        ),
                                        prefixIcon: Icon(
                                          Icons.person,
                                          //  color: _focusNodes[0].hasFocus ? AppColors.PRIMARY_COLOR: Colors.grey,
                                        )),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 8.0),
                                  child: TextFormField(
                                    cursorColor: AppColors.PRIMARY_COLOR,
                                    validator: (value) {
                                      if (value!.isEmpty ||
                                          !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                              .hasMatch(value)) {
                                        return "enter your email  ";
                                      } else {
                                        return null;
                                      }
                                    },
                                    //   focusNode: _focusNodes[0],
                                    controller: _emailController,
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          borderSide: BorderSide(
                                              color: AppColors.PRIMARY_COLOR,
                                              width: 1.5),
                                        ),
                                        hintText: "Your Email",
                                        errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          borderSide: BorderSide(
                                              color: AppColors.RED_COLOR,
                                              width: 1.5),
                                        ),
                                        prefixIcon: Icon(
                                          Icons.email,
                                          //  color: _focusNodes[0].hasFocus ? AppColors.PRIMARY_COLOR: Colors.grey,
                                        )),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 8.0),
                                  child: TextFormField(
                                    cursorColor: AppColors.PRIMARY_COLOR,
                                    validator: (value) {
                                      if (value!.isEmpty || value.length < 8) {
                                        return "the password must be at least 8 characters";
                                      } else {
                                        return null;
                                      }
                                    },
                                    //   focusNode: _focusNodes[0],
                                    controller: _passwordController,
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          borderSide: BorderSide(
                                              color: AppColors.PRIMARY_COLOR,
                                              width: 1.5),
                                        ),
                                        hintText: "Your Password",
                                        errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          borderSide: BorderSide(
                                              color: AppColors.RED_COLOR,
                                              width: 1.5),
                                        ),
                                        prefixIcon: Icon(
                                          Icons.key,
                                          //  color: _focusNodes[0].hasFocus ? AppColors.PRIMARY_COLOR: Colors.grey,
                                        )),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
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
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.to(SignUp());
                                    },
                                    child: Text(
                                      "Sign Up",
                                      style: TextStyle(fontSize: 20),
                                    ),
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
    );
  }
}
