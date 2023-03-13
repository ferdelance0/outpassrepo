import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../LoginPage.dart';

class UserAppbar extends StatelessWidget implements PreferredSizeWidget{
  UserAppbar({Key? key}) : super(key: key);
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return
      AppBar(

    elevation: 0,
    backgroundColor: Colors.transparent,
    automaticallyImplyLeading: false,
    title: Column(
    children: [
    Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    SizedBox(
    width: 15,
    ),
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
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => LoginPage()),
    );
    },
    icon: Icon(
    Icons.exit_to_app_sharp,
    color: Colors.black,
    )),
    SizedBox(
    width: 15,
    )
    ],


    );
  }
}
