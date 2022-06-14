import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../../resources/app_colors.dart';

class command extends StatefulWidget {
  const command({Key? key}) : super(key: key);
  @override
  State<command> createState() => _commandState();
}
class _commandState extends State<command> {
  String? selectedcnieliv;
  List listGender=["Gender","farah","rachid","bourigue","hamadi"];
  TextEditingController dateinput = TextEditingController();
  TextEditingController capacity = TextEditingController();


  @override
  void initState() {
    dateinput.text = "";
    capacity.text="1";
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


                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [



                        Expanded(
                          flex:2,
                          child: TextFormField(
                                inputFormatters: [ FilteringTextInputFormatter.digitsOnly],
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
                                  hintText: "Budjet",
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide:BorderSide(
                                        color: AppColors.PRIMARY_COLOR,
                                        width: 2),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.money,
                                    //  color: _focusNodes[0].hasFocus ? AppColors.PRIMARY_COLOR: Colors.grey,
                                  )),),
                        ),
                       Expanded(
                           flex: 3,
                           child:  Container(
                         padding: EdgeInsets.symmetric(horizontal: 30),
                         decoration: BoxDecoration(
                           border: Border.all(
                             color:AppColors.PRIMARY_COLOR,
                             width: 2,
                           ),
                           borderRadius: BorderRadius.all(Radius.circular(50)),
                         ),



                         child: Row(

                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                           children: [
                             Expanded(
                               flex:1,
                               child: Center(child:IconButton(icon:Icon(Icons.remove,size: 30,) , onPressed: () {  },))),
                             Expanded(
                                 flex: 2,
                               child: TextFormField(
                                 controller: capacity,
                                 validator:(value) {
                                   if ( value!.isEmpty ||value.length<10){
                                     return "the phone must be > 10 caracter";}
                                   else return null;},
                                 //   focusNode: _focusNodes[0],
                                 // controller: emailController,
                                 decoration: InputDecoration(
                                     enabledBorder:OutlineInputBorder(
                                       borderSide:BorderSide(
                                           color: AppColors.PRIMARY_COLOR,
                                           width: 2),
                                     ),

                                     focusedBorder: OutlineInputBorder(
                                       borderSide:BorderSide(
                                           color: AppColors.PRIMARY_COLOR,
                                           width: 2),
                                     ),
                                   ),),

                             ),Expanded(
                                 flex:1,
                                 child: Center(child: Text("+")))
                           ],
                         ),
                       ))
                        ,
                                    ],),
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

