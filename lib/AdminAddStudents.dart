import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AdminHeaderDrawer.dart';
import 'AdminHome.dart';

class AdminAddStudents extends StatefulWidget {
  const AdminAddStudents({Key? key}) : super(key: key);

  @override
  State<AdminAddStudents> createState() => _AdminAddStudentsState();
}

class _AdminAddStudentsState extends State<AdminAddStudents> {
  @override
  Widget build(BuildContext context) {
    var change = new GreetingChanger.changer("Add Students");
    return  Scaffold(
      appBar: AdminAppbar(),
      drawer: AdminDrawer(),
    );
  }
}
