// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roomie/resources/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roomie/resources/firebase_auth_constants.dart';
import 'package:roomie/views/SignUp/signup.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool password = true;
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  List<FocusNode> _focusNodes = [
    FocusNode(),
    FocusNode(),
  ];
  List<FocusNode> _focusNodes2 = [
    FocusNode(),
    FocusNode(),
  ];

  @override
  void initState() {
    _focusNodes.forEach((node) {
      node.addListener(() {
        setState(() {});
      });
    });
    _focusNodes2.forEach((node) {
      node.addListener(() {
        setState(() {});
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                      "Sign In",
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
                            width: 200,
                            height: 200,
                            child: SvgPicture.asset(
                              "assets/images/login.svg",
                            ),
                          ),
                          _inputField(context),

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

  _inputField(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          height: 30,
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.PRIMARY_COLOR, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(50))),
          child: TextField(
            focusNode: _focusNodes[0],
            controller: _emailController,
            decoration: InputDecoration(
                hintText: "Your Email",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none),
                prefixIcon: Icon(
                  Icons.email,
                  color: _focusNodes[0].hasFocus
                      ? AppColors.PRIMARY_COLOR
                      : Colors.grey,
                )),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.PRIMARY_COLOR, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(50))),
          child: TextField(
            controller: _passwordController,
            obscureText: true,
            focusNode: _focusNodes2[0],
            decoration: InputDecoration(
              hintText: "Your Password",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none),
              prefixIcon: Icon(
                Icons.key,
                color: _focusNodes2[0].hasFocus
                    ? AppColors.PRIMARY_COLOR
                    : Colors.grey,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Center(child: Text("Forget password ?")),
        SizedBox(
          height: 30,
        ),
        ElevatedButton(
          onPressed: () async {
            authController.login(
                _emailController.text.trim(), _passwordController.text.trim());
          },
          style: ElevatedButton.styleFrom(
            primary: AppColors.PRIMARY_COLOR,
            shape: StadiumBorder(),
            padding: EdgeInsets.symmetric(vertical: 16),
          ),
          child: Text(
            "Login",
            style: TextStyle(fontSize: 20),
          ),
        ),
        SizedBox(
          height: 80 * 0.9,
        ),
        Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Dont have an Acount ?"),
            GestureDetector(
              onTap: () {
                Get.to(SignUp());
              },
              child: Text(
                "Sign up",
                style: TextStyle(
                    color: AppColors.PRIMARY_COLOR,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        )),
      ],
    );
  }
}
