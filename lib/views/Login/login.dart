// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roomie/resources/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roomie/resources/firebase_auth_constants.dart';
import 'package:roomie/views/Home/widgets/navigation.dart';
import 'package:roomie/views/Profile/widgets/profileImage.dart';
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
  final List<FocusNode> _focusNodes = [
    FocusNode(),
    FocusNode(),
  ];
  final List<FocusNode> _focusNodes2 = [
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
                padding: EdgeInsets.symmetric(vertical: 11, horizontal: 30),
                child: Row(
                  children: [
                    arrowBack(),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Sign In",
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
              border: Border.all(color: AppColors.PRIMARY_COLOR, width: 1.5),
              borderRadius: BorderRadius.all(Radius.circular(50))),
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: TextField(
              cursorColor: AppColors.PRIMARY_COLOR,
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
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.PRIMARY_COLOR, width: 1.5),
              borderRadius: BorderRadius.all(Radius.circular(50))),
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: TextField(
              cursorColor: AppColors.PRIMARY_COLOR,
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
        ),
        SizedBox(
          height: 10,
        ),
        Center(
            child: Text(
          "Forget password ?",
          style: TextStyle(color: AppColors.PRIMARY_COLOR),
        )),
        SizedBox(
          height: 30,
        ),
        ElevatedButton(
          onPressed: () async {
            // ignore: unnecessary_null_comparison
            if (_emailController.text == '' && _passwordController.text == '') {
              var snackBar = SnackBar(
                /// need to set following properties for best effect of awesome_snackbar_content
                elevation: 0,
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.transparent,
                content: AwesomeSnackbarContent(
                  title: 'Oops Error!',
                  message: 'please fill in all required fields correctly!',

                  /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                  contentType: ContentType.failure,
                ),
              );

              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            } else {
              authController.login(_emailController.text.trim(),
                  _passwordController.text.trim());

              if (await FirebaseAuth.instance.currentUser?.uid != null) {
                Get.to(MyNavigationBar());
// not logged
              }
            }
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
            Text("Don't have an account ? "),
            GestureDetector(
              onTap: () {
                Get.to(SignUp());
              },
              child: Text(
                "Sign up",
                style: TextStyle(
                    color: AppColors.PRIMARY_COLOR,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        )),
      ],
    );
  }
}
