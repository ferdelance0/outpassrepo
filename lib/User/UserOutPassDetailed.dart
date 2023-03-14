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
    return Scaffold(
      appBar: UserAppbar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              child:Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text("Outpass",style: TextStyle(color:Color(0xffFFFFFF)),),

              ),
              width:1000,
              height: 580,
              decoration: BoxDecoration(
                  color: Color(0xff215DA2),
                  borderRadius: BorderRadius.circular(30)),
            ),
            MaterialButton(
              onPressed: () {},
              child: Text(
                "Cancel Outpass",
                style: TextStyle(color: Color(0xff760000)),
              ),
              color: Color(0xffFD5C5C),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(23)),
              elevation: 0,
            )
          ],
        ),
      ),
    );
  }
}
