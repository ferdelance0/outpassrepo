import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminTemp extends StatefulWidget {
  const AdminTemp({Key? key}) : super(key: key);

  @override
  State<AdminTemp> createState() => _AdminTempState();
}

class _AdminTempState extends State<AdminTemp> {
  @override
  final scaffoldKey = GlobalKey<ScaffoldState>();
  Widget build(BuildContext context) {
    return  Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xffADE8F4),
        key: scaffoldKey,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 15,),
                  Text(
                    "Hello User",
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Home",
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  )
                ],
              ),
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {
                  if (scaffoldKey.currentState!.isDrawerOpen) {
                    scaffoldKey.currentState!.closeDrawer();
                    //close drawer, if drawer is open
                  } else {
                    scaffoldKey.currentState!.openDrawer();
                    //open drawer, if drawer is closed
                  }
                },
                icon: Icon(
                  Icons.menu,
                  color: Colors.black,
                )),
            SizedBox(width: 15,)
          ],
        ),
        drawer: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Drawer(
            backgroundColor: Colors.transparent.withAlpha(29),
            elevation: 0,
            width: MediaQuery.of(context).size.width * .75,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListTile(
                  leading: Icon(Icons.add),
                  title: Text("Add new Students"),
                ),
                ListTile(
                  title: Text("Outpasses"),
                ),
                ListTile(
                  title: Text("Add new Students"),
                )
              ],
            ),
          ),
        ),
    );
  }
}
