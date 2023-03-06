
import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'UserHome.dart';
var username = TextEditingController();
var password = TextEditingController();
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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

                            var username1 = username.text;
                            var password1 = password.text;
                            if(username1=="user" && password1=="123"){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => UserHome()),

                              );
                              username.text="";
                              password.text="";
                            }
                            else{
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

                            };

                          },
                          child: Text('Submit',style: TextStyle(color: Colors.white,fontSize: 18.58,fontWeight: FontWeight.w100),),
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
    );
  }
}
