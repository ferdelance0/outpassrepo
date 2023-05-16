import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini/User/usermain.dart';
import 'package:bloc/bloc.dart';
import 'package:mini/security/SecurityHome.dart';
import 'package:mini/security/referencefileforqrscanner.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Bloc/LoginBloc.dart';
import 'LoginPage.dart';

void main() {
  SharedPreferences prefs;
  Widget _userwidget = usermain();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
        child: MultiBlocProvider(
            providers: [
          BlocProvider<LoginBloc>(
            create: (context) => LoginBloc(),
          ),
        ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Outpass',
              //prr
              theme: ThemeData(
                focusColor: Color(0xff215DA2),
                fontFamily: "Poppins",
                primarySwatch: Colors.blue,
              ),
              home: LoginPage(),
            )));
  }
}
