import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'UserTaskbar.dart';
class UserOutPassDetailed extends StatefulWidget {
  const UserOutPassDetailed({Key? key}) : super(key: key);

  @override
  State<UserOutPassDetailed> createState() => _UserOutPassDetailedState();
}

class _UserOutPassDetailedState extends State<UserOutPassDetailed> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xffADE8F4),
        appBar: UserAppbar(),
      ),
    );
  }
}
