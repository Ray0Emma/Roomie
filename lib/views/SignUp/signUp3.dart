
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../resources/app_colors.dart';

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
                  Icon(Icons.arrow_back_ios, size: 20, color: Colors.white,),
                  Text("Fill Profile", style: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 40),)
                ],),),
              SizedBox(height: 24,)
              ,
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
                        children: [SizedBox(height: 40,),
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

                                  child:CircleAvatar(radius:34,child: Container(

                                      child: Icon(Icons.school,color:AppColors.PRIMARY_COLOR,size:50,)),
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

                                  child:CircleAvatar(radius:34,child: Container(

                                      child: Icon(Icons.card_travel,color:AppColors.GRAY_Forced,size:50,)),
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

                                    child:CircleAvatar(radius:34,child: Container(
                                        child: Icon(Icons.computer,color:AppColors.GRAY_Forced,size:50,)),
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
                                    padding: EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color:AppColors.PRIMARY_COLOR,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(50)),
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                          hint: Text("      "+listGender[0]),
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
                                    padding: EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color:AppColors.PRIMARY_COLOR,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(50)),
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                          hint: Text("      "+listGender[0]),
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
                                    padding: EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color:AppColors.PRIMARY_COLOR,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(50)),
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                          hint: Text("      "+listGender[0]),
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
                                    padding: EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color:AppColors.PRIMARY_COLOR,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(50)),
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                          hint: Text("      "+listGender[0]),
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
                                      "Save",
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
