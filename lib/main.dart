import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Flutter Demo',
      theme: ThemeData(

        fontFamily: "Poppins",
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}
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
                            // Action to perform when the button is pressed
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
