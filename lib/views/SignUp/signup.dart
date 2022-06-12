
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../resources/app_colors.dart';
class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  @override
  State<SignUp> createState() => _SignUp1State();
}
class _SignUp1State extends State<SignUp> {
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
                child: Row(children: [
                  Icon(Icons.arrow_back_ios, size: 40, color: Colors.white,),
                  Text("Sign In", style: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 40),)
                ],),),
              Expanded(

                child: Container(
                    padding: EdgeInsets.all(30),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30))
                    ),
                    child: SingleChildScrollView(

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: SvgPicture.asset("assets/images/login.svg",),
                            width: 200,
                            height: 200,),
                          Form(
                              key: formState,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  SizedBox(height: 30,),
                                  TextFormField(
                                    validator:(value) {
                                      if ( value!.isEmpty){
                                        return "entrer your Full name  ";}
                                      else return null;},
                                    //   focusNode: _focusNodes[0],
                                    // controller: emailController,
                                    decoration: InputDecoration(
                                        enabledBorder:OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(50),
                                          borderSide:BorderSide(
                                              color: AppColors.PRIMARY_COLOR,
                                              width: 2),
                                        ),
                                        hintText: "Your Full Name",
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(50),
                                          borderSide:BorderSide(
                                              color: AppColors.PRIMARY_COLOR,
                                              width: 2),
                                        ),
                                        prefixIcon: Icon(
                                          Icons.email,
                                          //  color: _focusNodes[0].hasFocus ? AppColors.PRIMARY_COLOR: Colors.grey,
                                        )),),
                                  SizedBox(height: 20,),
                                  TextFormField(
                                    validator:(value) {
                                      if ( value!.isEmpty || !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
                                        return "entrer un email  ";}
                                      else return null;},
                                    //   focusNode: _focusNodes[0],
                                    // controller: emailController,
                                    decoration: InputDecoration(
                                        enabledBorder:OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(50),
                                          borderSide:BorderSide(
                                              color: AppColors.PRIMARY_COLOR,
                                              width: 2),
                                        ),
                                        hintText: "Your Email",
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(50),
                                          borderSide:BorderSide(
                                              color: AppColors.PRIMARY_COLOR,
                                              width: 2),
                                        ),
                                        prefixIcon: Icon(
                                          Icons.email,
                                          //  color: _focusNodes[0].hasFocus ? AppColors.PRIMARY_COLOR: Colors.grey,
                                        )),),
                                  SizedBox(height: 20,),
                                  TextFormField(
                                    validator:(value) {
                                      if ( value!.isEmpty ||value.length<8){
                                        return "entrer un Password  begin then 8 caracter";}
                                      else return null;},
                                    //   focusNode: _focusNodes[0],
                                    // controller: emailController,
                                    decoration: InputDecoration(
                                        enabledBorder:OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(50),
                                          borderSide:BorderSide(
                                              color: AppColors.PRIMARY_COLOR,
                                              width: 2),
                                        ),
                                        hintText: "Your Password",
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(50),
                                          borderSide:BorderSide(
                                              color: AppColors.PRIMARY_COLOR,
                                              width: 2),
                                        ),
                                        prefixIcon: Icon(
                                          Icons.email,
                                          //  color: _focusNodes[0].hasFocus ? AppColors.PRIMARY_COLOR: Colors.grey,
                                        )),),
                                  SizedBox(height: 30,),
                                  ElevatedButton(
                                    onPressed: () {
                                      send();

                                      //  print(emailController.text);
                                      //  print(passwordController.text);
                                      // signin();
                                    },
                                    child: Text(
                                      "SinUp",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      primary: AppColors.PRIMARY_COLOR,
                                      shape: StadiumBorder(),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 16),
                                    ),
                                  ),

                                ],
                              )),
                          // _forgotPassword(context),
                          // _signup(context),
                        ],),
                    )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

