
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mini/security/SecurityHome.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Admin/AdminHome.dart';
import 'Bloc/DetailsBloc.dart';
import 'Bloc/LoginBloc.dart';
import 'User/UserHome.dart';

import 'package:flutter_native_splash/flutter_native_splash.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var username = TextEditingController();
  var password = TextEditingController();
  late SharedPreferences prefs;
  bool isTextFieldenable = true;
  @override
  void initState() {
    initSharedPref();
    initialization();
  }

  void initialization() async {
    //splash screen odumbo enthekilum proccess venemenkil ivide ittal mathiyakum
    FlutterNativeSplash.remove();
  }
  Future<void> initSharedPref() async {
    prefs=await SharedPreferences.getInstance();
  }
  @override
  Widget build(BuildContext context) {

    return  WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/blob-scene-haikei.png"),fit: BoxFit.fill) ),
          child: SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(38, 0, 38, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Login" ,style: TextStyle(fontSize: 57.6,fontWeight: FontWeight.w600,color: Color(0xff2E65A2)),),
                    SizedBox(height: 17,),
                    SizedBox(
                      width:  MediaQuery.of(context).size.width * 1,
                      child: TextField(
                        enabled: isTextFieldenable,
                        controller: username,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xffB4E3EC),
                            prefixIconColor: Colors.black,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(17))
                            ),
                            hintText: 'Username',prefixIcon: Icon(Icons.person_2_rounded)
                        ),
                      ),
                    ),
                    SizedBox(height: 17,),
                    SizedBox(
                      width:  MediaQuery.of(context).size.width * .9555,
                      child: TextField(obscureText: true,
                        controller: password,
                        enabled: isTextFieldenable,
                        decoration: InputDecoration(

                            filled: true,
                            fillColor: Color(0xffB4E3EC),
                            prefixIconColor: Colors.black,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(17))
                            ),
                            hintText: 'Password',prefixIcon: Icon(Icons.lock)
                        ),),
                    ),
                    SizedBox(height: 17,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          child: MaterialButton(
                            height: 43.12 ,
                            minWidth: 133.62,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(29.0),
                            ),
                            elevation: 0,
                            color: Color(0xff03045E),
                            onPressed: () {
                              setState(() {
                                isTextFieldenable = false;
                              });
                                BlocProvider.of<LoginBloc>(context).add(
                                VerifyPassword(
                                username: username.text,
                                password: password.text)
                                );
                                },
                            child: BlocConsumer<LoginBloc,LoginStates>(
                              listener: (context,state){
                                if(state is LoginSuccessAdmin){
                                  Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => AdminHome()),
                                  );
                                }
                                if(state is LoginSuccessUser){

                                  Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => UserHome()),
                                  );
                                }
                                if(state is LoginSuccessSec){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => QRCodeScannerPage()),
                                  );
                                }
                                if (state is LoginError){
                                  setState(() {
                                    isTextFieldenable = true;
                                  });
                                  CherryToast.error(
                                    title: Text(''),
                                    enableIconAnimation: false,
                                    displayTitle: false,
                                    description: Text('Invalid account information',style: TextStyle(fontSize: 12),),
                                    toastPosition: Position.top,
                                    animationDuration: Duration(milliseconds: 500),
                                    toastDuration: Duration(milliseconds: 1500),
                                    autoDismiss: true,
                                  ).show(context);
                                }

                              },

                              builder:(context,state){
                                if(state is Loading){
                                  return LoadingAnimationWidget.staggeredDotsWave(
                                  color: Colors.white,
                                  size: 30,
                                  );
                                }
                                else{
                                  return Text('Submit',style: TextStyle(color: Colors.white,fontSize: 18.58,fontWeight: FontWeight.w100));
                                }
                              }
                              )
                           ,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 50,)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
