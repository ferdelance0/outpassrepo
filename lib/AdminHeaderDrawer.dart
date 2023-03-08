
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'AdminAddStudents.dart';
import 'AdminHome.dart';
import 'LoginPage.dart';

class AdminDrawer extends StatefulWidget {
  const AdminDrawer({Key? key}) : super(key: key);

  @override
  State<AdminDrawer> createState() => _AdminDrawerState();
}
class _AdminDrawerState extends State<AdminDrawer> {
  @override
  Widget build(BuildContext context) {
    return  BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
      child: Drawer(

        backgroundColor: Colors.transparent.withAlpha(29),
        elevation: 0,
        width: MediaQuery.of(context).size.width * .75,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              onTap: (){Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AdminAddStudents()),

              );},
              leading: Icon(Ionicons.person_add_outline,color: Colors.white),
              title: Text("Add new Students",style: TextStyle(color: Colors.white)),
            ),
            ListTile(
              onTap: (){Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AdminHome()),

              );},
              leading: Icon(Ionicons.documents_outline,color: Colors.white),
              title: Text("Outpasses",style: TextStyle(color: Colors.white)),
            ),
            ListTile(
              onTap: (){Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),

              );},

              leading: Icon(Ionicons.walk_outline,color: Colors.white),
              title: Text("SignOut",style: TextStyle(color: Colors.white),),
            )
          ],
        ),

      ),
    );
  }
}
String Greeting = "";
class GreetingChanger{
  GreetingChanger.changer(String s){
    Greeting = s;
  }

}



class AdminAppbar extends StatelessWidget implements PreferredSizeWidget {
  AdminAppbar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  AppBar(
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
                "Hello Admin",
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                Greeting,
                style: TextStyle(color: Colors.black, fontSize: 12),
              )
            ],
          ),
        ],
      ),
      actions: [
        IconButton(
            onPressed: () {
              final ScaffoldState? scaffold = Scaffold.of(context);
              if (scaffold!.isDrawerOpen) {
                scaffold.openDrawer();
              } else {
                scaffold.openDrawer();
              }
            },
            icon: Icon(
              Icons.menu,
              color: Colors.black,
            )),
        SizedBox(width: 15,)
      ],

      // Return the desired size of the app bar.
      // You can adjust the height as needed.

    );
  }

  // Override the preferredSize property to return the desired size of the app bar.
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
