import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:mini/Bloc/ApplyOpBloc.dart';
import 'package:mini/security/SecurityHome.dart';
import 'package:mini/security/referencefileforqrscanner.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Bloc/LoginBloc.dart';
import 'LoginPage.dart';
import 'User/UserHome.dart';

void main() {
  SharedPreferences prefs;
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
              BlocProvider<ApplyOpBloc>(
                create: (context) => ApplyOpBloc(),
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
