import 'package:flutter/material.dart';
import 'package:mini/User/usermain.dart';
import 'LoginPage.dart';
void main() {
  Widget _userwidget = usermain();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Outpass',
      theme: ThemeData(
        focusColor: Color(0xff215DA2),
        fontFamily: "Poppins",
        primarySwatch:  Colors.blue,
      ),
      home:  LoginPage(),
    );
  }
}