
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../resources/app_colors.dart';
class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  
  //for changing color icon the TextFormField
  List<FocusNode> _focusNodes = [
    FocusNode(),
    FocusNode(),
  ];
  @override
  void initState() {
    _focusNodes.forEach((node){
      node.addListener(() {
        setState(() {});
      });
    });

    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formState=new GlobalKey<FormState>();
    
send(){
var formdata=formState.currentState;
   if(formdata!.validate())
     print("gggggggggggg");
     else print("errore asi hamadi");
    }
    return  SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.PRIMARY_COLOR,
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding:EdgeInsets.symmetric(vertical:9,horizontal:30) ,
                child:Row(children: [Icon(Icons.arrow_back_ios,size:40,color: Colors.white,),Text("Sign In",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize:40 ),)],),),
                       Expanded(

                child:  Container(
                    padding:EdgeInsets.all(30) ,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30))
                    ),
                    child:SingleChildScrollView(

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child:SvgPicture.asset("assets/images/login.svg",),width: 200,height: 200,),
                            Form(
                              key: formState,
                              child:_inputField(context)),

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





  _inputField(context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize:MainAxisSize.max,
      children: [
        SizedBox(height: 30,),
        TextFormField(
validator: (text){
if(text=="hhhhh"){
  return "niiice hhhhhhhh";
  }
  else return null;



},
            focusNode: _focusNodes[0],
            // controller: emailController,
            decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
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
                  color: _focusNodes[0].hasFocus ? AppColors.PRIMARY_COLOR: Colors.grey,
                )


            ),
          ),
     
        SizedBox(height: 10,),
        Center(child: Text("Forget password ?")),
        SizedBox(height: 30,),
        ElevatedButton(
          onPressed: () {
            context.send();
       
            //  print(emailController.text);
            //  print(passwordController.text);
            // signin();
          },
          child: Text(
            "Login",
            style: TextStyle(fontSize: 20),
          ),
          style: ElevatedButton.styleFrom(
            primary:AppColors.PRIMARY_COLOR,
            shape: StadiumBorder(),
            padding: EdgeInsets.symmetric(vertical: 16),
          ),
        ),
        SizedBox(height: 80*0.9,),
        Center(child: Row( mainAxisAlignment: MainAxisAlignment.center,children: [Text("Dont have an Acount ?"),Text("Sign up",style: TextStyle(color:AppColors.PRIMARY_COLOR,fontSize:20,fontWeight: FontWeight.w500),)],)),
      ],
    );
  }


}
