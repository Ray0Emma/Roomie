
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

class SignUp2 extends StatefulWidget {
  const SignUp2({Key? key}) : super(key: key);
  @override
  State<SignUp2> createState() => _SignUp2State();
}
class _SignUp2State extends State<SignUp2> {
  String? selectedcnieliv;
  List listGender=["Gender","farah","rachid","bourigue","hamadi"];
  TextEditingController dateinput = TextEditingController();
  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
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
        backgroundColor: AppColors.PRIMARY_COLOR,
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 9, horizontal: 30),
                child: Row(children: [
                  Icon(Icons.arrow_back_ios, size: 40, color: Colors.white,),
                  Text("Fill Profile", style: TextStyle(color: Colors.white,
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
                            child: CircleAvatar(child: Icon(Icons.person_outline_rounded,color: Colors.white,size:100,),backgroundColor:Colors.grey),
                            width: 150,
                            height: 150,),
                          Form(
                              key: formState,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  SizedBox(height: 20,),
                                  Container(

                                      child:Center(
                                     child:TextFormField(
                                              controller: dateinput,
                                              decoration: InputDecoration(
                                                enabledBorder:OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(50),
                                                  borderSide:BorderSide(
                                                      color: AppColors.PRIMARY_COLOR,
                                                      width: 2),
                                                ),
                                                hintText: "Enter Date",
                                                focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(50),
                                                  borderSide:BorderSide(
                                                      color: AppColors.PRIMARY_COLOR,
                                                      width: 2),
                                                ),
                                                prefixIcon: Icon(
                                                  Icons.calendar_today,
                                                  //  color: _focusNodes[0].hasFocus ? AppColors.PRIMARY_COLOR: Colors.grey,
                                                )),
                                            readOnly: true,  //set it true, so that user will not able to edit text
                                            onTap: () async {
                                              DateTime? pickedDate = await showDatePicker(

                                                  context: context, initialDate: DateTime.now(),
                                                  firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                                                  lastDate: DateTime(2101)
                                              );

                                              if(pickedDate != null ){
                                                print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                                                String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                                                print(formattedDate); //formatted date output using intl package =>  2021-03-16
                                                //you can implement different kind of Date Format here according to your requirement

                                                setState(() {
                                                  dateinput.text = formattedDate; //set output date to TextField value.
                                                });
                                              }else{
                                                print("Date is not selected");
                                              }
                                            },
                                          )
                                      )
                                  ),
                                  SizedBox(height: 15,),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color:AppColors.PRIMARY_COLOR,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(50)),
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(

                                          isExpanded: true,
                                          iconSize: 40,
                                          iconEnabledColor:AppColors.PRIMARY_COLOR,
                                          iconDisabledColor:AppColors.PRIMARY_COLOR,
                                          value: selectedcnieliv,
                                          items: listGender.map((list) {
                                            return DropdownMenuItem<String>(
                                                value: list[0],
                                                child: Text("      "+list,
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        )));
                                          }).toList(),
                                          onChanged: (value) =>
                                              setState(() => selectedcnieliv = value!)),
                                    ),
                                  ),
                                  SizedBox(height: 15,),
                                  TextFormField(
                                    validator:(value) {
                                      if ( value!.isEmpty ||value.length<10){
                                        return "the phone must be > 10 caracter";}
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
                                        hintText: "Your Phone",
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(50),
                                          borderSide:BorderSide(
                                              color: AppColors.PRIMARY_COLOR,
                                              width: 2),
                                        ),
                                        prefixIcon: Icon(
                                          Icons.phone,
                                          //  color: _focusNodes[0].hasFocus ? AppColors.PRIMARY_COLOR: Colors.grey,
                                        )),),
                                  SizedBox(height: 15,),
                                  TextFormField(
                                    maxLines: 3,
                                    validator:(value) {
                                      if ( value!.isEmpty ||value.length<8){
                                        return "entrer un Password  begin then 8 caracter";}
                                      else return null;},
                                    //   focusNode: _focusNodes[0],
                                    // controller: emailController,
                                    decoration: InputDecoration(
                                        enabledBorder:OutlineInputBorder(

                                          borderRadius: BorderRadius.circular(20),
                                          borderSide:BorderSide(
                                              color: AppColors.PRIMARY_COLOR,
                                              width: 2),
                                        ),
                                        hintText: "A little About You",

                                        focusedBorder: OutlineInputBorder(

                                          borderRadius: BorderRadius.circular(20),
                                          borderSide:BorderSide(
                                              color: AppColors.PRIMARY_COLOR,
                                              width: 2),
                                        ),
                                        prefixIcon: Icon(
                                          Icons.text_fields,
                                          //  color: _focusNodes[0].hasFocus ? AppColors.PRIMARY_COLOR: Colors.grey,
                                        )),),
                                  SizedBox(height: 20,),
                                  ElevatedButton(
                                    onPressed: () {
                                      send();

                                      //  print(emailController.text);
                                      //  print(passwordController.text);
                                      // signin();
                                    },
                                    child: Text(
                                      "Continue",
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

class SignUp3 extends StatefulWidget {
  const SignUp3({Key? key}) : super(key: key);
  @override
  _SignUp3State createState() => _SignUp3State();
}
class _SignUp3State extends State<SignUp3> {
  String? selectedcnieliv1;
  String? selectedcnieliv2;
  String? selectedcnieliv3;
  String? selectedcnieliv4;
  List listGender=["Gender","farah","rachid","bourigue","hamadi"];
  TextEditingController dateinput = TextEditingController();
  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
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
        backgroundColor: AppColors.PRIMARY_COLOR,
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 9, horizontal: 30),
                child: Row(children: [
                  Icon(Icons.arrow_back_ios, size: 40, color: Colors.white,),
                  Text("Fill Profile", style: TextStyle(color: Colors.white,
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



                       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [      SizedBox(height: 40,),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                              Column(children: [
                                Container(
                                  padding: EdgeInsets.all(0),
                                  decoration:BoxDecoration(

                                      border: Border.all(color: AppColors.PRIMARY_COLOR,width: 2),
                                      borderRadius:BorderRadius.all(Radius.circular(200))
                                  ),

                                  child:CircleAvatar(radius:50,child: Container(

                                      child: Icon(Icons.school,color:AppColors.PRIMARY_COLOR,size:80,)),
                                    backgroundColor:AppColors.PRIMARY_COLOR.withOpacity(0.3)
                                  ),
                                    ),
                              SizedBox(height: 10,),
                              Text("Student",style: TextStyle(color: AppColors.PRIMARY_COLOR,fontWeight: FontWeight.w500),)
                            ],),
                              Column(children: [
                             Container(
                               padding: EdgeInsets.all(0),
                               decoration:BoxDecoration(

                                   border: Border.all(color: AppColors.GRAY_Forced,width: 2),
                                   borderRadius:BorderRadius.all(Radius.circular(200))
                               ),

                               child:CircleAvatar(radius:50,child: Container(

                                   child: Icon(Icons.school,color:AppColors.GRAY_Forced,size:80,)),
                                   backgroundColor:Colors.white
                               ),
                             ),
                             SizedBox(height: 10,),
                             Text("Professionall",style: TextStyle(color: AppColors.PRIMARY_COLOR,fontWeight: FontWeight.w500),)
                           ],),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [

                             Container(
                                   decoration:BoxDecoration(
                                   border: Border.all(color: AppColors.GRAY_Forced,width: 2),
                                   borderRadius:BorderRadius.all(Radius.circular(200))
                               ),

                               child:CircleAvatar(radius:50,child: Container(
                                   child: Icon(Icons.computer,color:AppColors.GRAY_Forced,size:80,)),
                                   backgroundColor:Colors.white
                               ),
                             ),
                             SizedBox(height: 10,),
                             Text("FreeLnacer",style: TextStyle(color: AppColors.PRIMARY_COLOR,fontWeight: FontWeight.w500),)
                           ],),



                            ],)
                           ,
                         Form(
                              key: formState,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  SizedBox(height: 40,),
                                  SizedBox(height: 20,),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color:AppColors.PRIMARY_COLOR,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(50)),
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(

                                          isExpanded: true,
                                          iconSize: 40,
                                          iconEnabledColor:AppColors.PRIMARY_COLOR,
                                          iconDisabledColor:AppColors.PRIMARY_COLOR,
                                          value: selectedcnieliv1,
                                          items: listGender.map((list) {
                                            return DropdownMenuItem<String>(
                                                value: list[0],
                                                child: Text("      "+list,
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                    )));
                                          }).toList(),
                                          onChanged: (value) =>
                                              setState(() => selectedcnieliv1 = value!)),
                                    ),
                                  ),
                                  SizedBox(height: 20,),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color:AppColors.PRIMARY_COLOR,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(50)),
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(

                                          isExpanded: true,
                                          iconSize: 40,
                                          iconEnabledColor:AppColors.PRIMARY_COLOR,
                                          iconDisabledColor:AppColors.PRIMARY_COLOR,
                                          value: selectedcnieliv2,
                                          items: listGender.map((list) {
                                            return DropdownMenuItem<String>(
                                                value: list[0],
                                                child: Text("      "+list,
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                    )));
                                          }).toList(),
                                          onChanged: (value) =>
                                              setState(() => selectedcnieliv2 = value!)),
                                    ),
                                  ),
                                  SizedBox(height: 20,),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color:AppColors.PRIMARY_COLOR,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(50)),
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(

                                          isExpanded: true,
                                          iconSize: 40,
                                          iconEnabledColor:AppColors.PRIMARY_COLOR,
                                          iconDisabledColor:AppColors.PRIMARY_COLOR,
                                          value: selectedcnieliv3,
                                          items: listGender.map((list) {
                                            return DropdownMenuItem<String>(
                                                value: list[0],
                                                child: Text("      "+list,
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                    )));
                                          }).toList(),
                                          onChanged: (value) =>
                                              setState(() => selectedcnieliv3 = value!)),
                                    ),
                                  ),
                                  SizedBox(height: 20,),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color:AppColors.PRIMARY_COLOR,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(50)),
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(

                                          isExpanded: true,
                                          iconSize: 40,
                                          iconEnabledColor:AppColors.PRIMARY_COLOR,
                                          iconDisabledColor:AppColors.PRIMARY_COLOR,
                                          value: selectedcnieliv4,
                                          items: listGender.map((list) {
                                            return DropdownMenuItem<String>(
                                                value: list[0],
                                                child: Text("      "+list,
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                    )));
                                          }).toList(),
                                          onChanged: (value) =>
                                              setState(() => selectedcnieliv4 = value!)),
                                    ),
                                  ),
                                  SizedBox(height: 40,),
                                  ElevatedButton(
                                    onPressed: () {
                                      send();

                                      //  print(emailController.text);
                                      //  print(passwordController.text);
                                      // signin();
                                    },
                                    child: Text(
                                      "Continue",
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
