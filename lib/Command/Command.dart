import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import '../../controllers/commandeController.dart';
import '../../resources/app_colors.dart';
import 'dart:io' as io;
import 'upload/storage.dart';

class command extends StatefulWidget {
  comandeContrller  c=Get.find();

  @override
  State<command> createState() => _commandState();
}
class _commandState extends State<command> {

comandeContrller c=Get.find();

   @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formState = new GlobalKey<FormState>();
    send() async {
      var formdata = formState.currentState;
      if (formdata!.validate()) {
      } else {
        print("error");
      }
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor:Colors.white,
        body:   GetBuilder<comandeContrller>(
            builder: (comandecontroller) => Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Stack(
                                    children: <Widget>[
                                      Container(
                                        width: double.infinity,
                                        height: 200,
                                        color: Colors.black12,
                                        child:comandecontroller.image == null
                                            ? Icon(
                                          Icons.image,
                                          size: 50,
                                          color: Colors.white,
                                        )
                                            : Image.file(
                                          comandecontroller.image!,
                                          fit: BoxFit.fill,
                                        ) ,
                                      ),
                                      Positioned(
                                        right: 20,
                                        top:20,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: AppColors.PRIMARY_COLOR,
                                            border: Border.all(
                                              color:AppColors.PRIMARY_COLOR,
                                            ),
                                            borderRadius: BorderRadius.all(Radius.circular(10)),
                                          ),
                                          width: 40,
                                          height: 40,
                                          child: Center(child: IconButton(icon:Icon(Icons.upload_file,color: Colors.white,) , onPressed: () async {
                                            comandecontroller.getImage(context).then((file) {
                                              setState((){
                                                comandecontroller.image = io.File(file.path);
                                              });
                                              print(comandecontroller.image);
                                            });
                                            } ,)),
                                        ),
                                      ),
                                    ],
                                  ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                  Row(children: [
                                    Expanded(
                                      flex:2,
                                      child:Column(
                                        children: [
                                          Text("Budget:"),
                                          SizedBox(height: 10,),
                                          TextFormField(
                                            controller: comandecontroller.budget,
                                            inputFormatters: [ FilteringTextInputFormatter.digitsOnly],
                                            validator:(value) {
                                              if ( value!.isEmpty ){
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
                                        ],
                                      ), ),

                                    SizedBox(width: 30,),
                                    Expanded(
                                      flex: 3,
                                      child:Column(
                                        children: [
                                          Text("Capacity:"),
                                          SizedBox(height: 10,),
                                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                            Expanded(
                                                flex: 2,
                                                child:  Container(
                                                  height: 60,
                                                  padding: EdgeInsets.symmetric(horizontal: 10),
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
                                                          child: Center(
                                                              child:InkWell(onTap:(){comandecontroller.incrimenter();},child: Text("+",style: TextStyle(color:AppColors.PRIMARY_COLOR,fontSize: 50,fontWeight: FontWeight.w400),),))),
                                                      SizedBox(width: 10),

                                                      Expanded(
                                                        flex: 3,
                                                        child: Container(
                                                          alignment: Alignment.center,
                                                          height: double.infinity,

                                                            decoration: BoxDecoration(
                                                              border: Border.all(
                                                                color:AppColors.PRIMARY_COLOR,
                                                                width: 2,
                                                              ),
                                                             // borderRadius: BorderRadius.all(Radius.circular(50)),
                                                            ),
                                                            child: Text("${comandecontroller.capacitycounter}",style: TextStyle(fontSize: 34,fontWeight:FontWeight.w500),)),

                                                      ),   SizedBox(width: 10)
                                                      ,Expanded(
                                                          flex:1,
                                                          child: Center(child: InkWell(onTap:(){comandecontroller.dincrimenter();},child: Text("-",style: TextStyle(color:AppColors.PRIMARY_COLOR,fontSize: 50,fontWeight: FontWeight.w400),)))
                                                      )]
                                                  ),
                                                )),
                                          ],),
                                        ],
                                      )
                                      ,)
                                  ],),
                                  SizedBox(height: 12,),
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
                                                hint: Text("    City",style: TextStyle(
                                                  fontSize: 20,
                                                )),
                                          isExpanded: true,
                                          iconSize: 40,
                                          iconEnabledColor:AppColors.PRIMARY_COLOR,
                                          iconDisabledColor:AppColors.PRIMARY_COLOR,
                                          value: comandecontroller.selectedcnieliv,
                                          items: comandecontroller.listGender.map((list) {
                                            return DropdownMenuItem<String>(
                                                value: list,
                                                child: Text("       "+list,
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                    )));
                                          }).toList(),
                                          onChanged: (value) =>
                                              setState(() => comandecontroller.selectedcnieliv = value!)),
                                    ),
                                  ),
                                  SizedBox(height: 12,),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 2),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color:AppColors.PRIMARY_COLOR,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(20)),
                                    ),

                                    child: MultiSelectFormField(
                                      border: InputBorder.none,
                                      autovalidate: AutovalidateMode.disabled,
                                      chipBackGroundColor:AppColors.PRIMARY_COLOR,
                                      chipLabelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                                      dialogTextStyle: TextStyle(fontWeight: FontWeight.bold),
                                      checkBoxActiveColor: AppColors.PRIMARY_COLOR,
                                      checkBoxCheckColor: Colors.white,
                                      dialogShapeBorder: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12.0))),
                                      title: Text(
                                        "Equipment",
                                        style: TextStyle(fontSize: 16,color:AppColors.PRIMARY_COLOR,fontWeight:FontWeight.w600),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.length == 0) {
                                          return 'Please select one or more options';
                                        }
                                        return null;
                                      },
                                      dataSource: [
                                        {
                                          "display": "Running",
                                          "value": "Running",
                                        },
                                        {
                                          "display": "Climbing",
                                          "value": "Climbing",
                                        },
                                        {
                                          "display": "Walking",
                                          "value": "Walking",
                                        },
                                        {
                                          "display": "Swimming",
                                          "value": "Swimming",
                                        },
                                        {
                                          "display": "Soccer Practice",
                                          "value": "Soccer Practice",
                                        },
                                        {
                                          "display": "Baseball Practice",
                                          "value": "Baseball Practice",
                                        },
                                        {
                                          "display": "Football Practice",
                                          "value": "Football Practice",
                                        },
                                      ],
                                      textField: 'display',
                                      valueField: 'value',
                                      okButtonLabel: 'OK',
                                      cancelButtonLabel: 'CANCEL',
                                      hintWidget: Text('Please choose one or more'),
                                      initialValue: comandecontroller.Equipment,
                                      onSaved: (value) {
                                        if (value == null) return;
                                        setState(() {
                                          comandecontroller.Equipment = value;
                                        });
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 2),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color:AppColors.PRIMARY_COLOR,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(20)),
                                    ),

                                    child: MultiSelectFormField(
                                      border: InputBorder.none,
                                      autovalidate: AutovalidateMode.disabled,
                                      chipBackGroundColor:AppColors.PRIMARY_COLOR,
                                      chipLabelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                                      dialogTextStyle: TextStyle(fontWeight: FontWeight.bold),
                                      checkBoxActiveColor: AppColors.PRIMARY_COLOR,
                                      checkBoxCheckColor: Colors.white,
                                      dialogShapeBorder: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12.0))),
                                      title: Text(
                                        "Regulation",
                                        style: TextStyle(fontSize: 16,color:AppColors.PRIMARY_COLOR,fontWeight:FontWeight.w600),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.length == 0) {
                                          return 'Please select one or more options';
                                        }
                                        return null;
                                      },
                                      dataSource: [
                                        {
                                          "display": "Running",
                                          "value": "Running",
                                        },
                                        {
                                          "display": "Climbing",
                                          "value": "Climbing",
                                        },
                                        {
                                          "display": "Walking",
                                          "value": "Walking",
                                        },
                                        {
                                          "display": "Swimming",
                                          "value": "Swimming",
                                        },
                                        {
                                          "display": "Soccer Practice",
                                          "value": "Soccer Practice",
                                        },
                                        {
                                          "display": "Baseball Practice",
                                          "value": "Baseball Practice",
                                        },
                                        {
                                          "display": "Football Practice",
                                          "value": "Football Practice",
                                        },
                                      ],
                                      textField: 'display',
                                      valueField: 'value',
                                      okButtonLabel: 'OK',
                                      cancelButtonLabel: 'CANCEL',
                                      hintWidget: Text('Please choose one or more'),
                                      initialValue: comandecontroller.Regulation,
                                      onSaved: (value) {
                                        if (value == null) return;
                                        setState(() {
                                          comandecontroller.Regulation = value;
                                        });
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 12,),
                                  TextFormField(
                                    controller:comandecontroller.Addresse ,
                                   /* validator:(value) {
                                      if ( value!.isEmpty ||value.length<10){
                                        return "the phone must be > 10 caracter";}
                                      else return null;},*/
                                    //   focusNode: _focusNodes[0],
                                    // controller: emailController,
                                    decoration: InputDecoration(
                                        enabledBorder:OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(50),
                                          borderSide:BorderSide(
                                              color: AppColors.PRIMARY_COLOR,
                                              width: 2),
                                        ),
                                        hintText: "Your Adresse",
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(50),
                                          borderSide:BorderSide(
                                              color: AppColors.PRIMARY_COLOR,
                                              width: 2),
                                        ),
                                        prefixIcon: Icon(
                                          Icons.location_city,
                                          //  color: _focusNodes[0].hasFocus ? AppColors.PRIMARY_COLOR: Colors.grey,
                                        )),),
                                  SizedBox(height: 12,),



                                  ElevatedButton(
                                    onPressed: () async {
                                      send();
                                      comandecontroller.addcommande(context);
                                    },
                                    child: Text(
                                      "Post",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      primary: AppColors.PRIMARY_COLOR,
                                      shape: StadiumBorder(),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 16),
                                    ),
                                  ),

                                ],),)
                                ],
                              ),
                              // _forgotPassword(context),
                              // _signup(context),
                            ],),
                        )
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
/*class uplodeimg extends StatefulWidget {
  @override
  _uplodeimgState createState() => _uplodeimgState();
}

class _uplodeimgState extends State<uplodeimg> {

  io.File?image;
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

                    });
                  });
                }),
            TextButton(
                onPressed: () {
                 if (image != null){
                    _storage.uploadFile(image!, context);

               //  print(_storage.uploadFile(image!, context).toString());
               }
                  else
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("No Image was selected")));
                },
                child: Text('Upload Image'))
          ],
        ),
      ),
    );
  }
}*/