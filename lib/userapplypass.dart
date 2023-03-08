import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

import 'LoginPage.dart';

class ApplyOutpass extends StatefulWidget {
  const ApplyOutpass({Key? key}) : super(key: key);

  @override
  State<ApplyOutpass> createState() => _ApplyOutpassState();
}

class _ApplyOutpassState extends State<ApplyOutpass> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xffADE8F4),
      appBar: AppBar(

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

      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: 450,
          width: 365,
          decoration: BoxDecoration(
            color: Color(0xff215DA2),
            borderRadius: BorderRadius.circular(17)
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                TextField(
                  controller: username,
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
                SizedBox(height: 33,),
                TextField(
                  controller: username,
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
                SizedBox(height: 12,),
                PrettyQr(
                  elementColor: Colors.orange,
                  typeNumber: 1,
                  size: 200,
                  data: '12441',
                  errorCorrectLevel: QrErrorCorrectLevel.M,
                  roundEdges: true,
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
