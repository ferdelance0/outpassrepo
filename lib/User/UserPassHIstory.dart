import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import 'UserTaskbar.dart';

class UserHistory extends StatefulWidget {
  const UserHistory({Key? key}) : super(key: key);

  @override
  State<UserHistory> createState() => _UserHistoryState();
}

class _UserHistoryState extends State<UserHistory> {
  List<Text>FakeText=[
    Text("Outpass is valid till 13-04-23"),
    Text("Expired"),
    Text("Expired"),
  ];
  List<Color>Colores=[
    Color(0xff7EEC58),
    Color(0xffABBDD3),
    Color(0xffABBDD3),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffADE8F4),
      appBar: UserAppbar(),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xff023E8A),
                          Color(0xff2B6AB9),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(19.59)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(13, 5, 11, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Home Visit",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700),
                            ),
                            Center(
                                child: SizedBox(
                                  width: 15,
                                )),
                            Center(
                                child: Text("at",
                                    style: TextStyle(
                                        color: Color(0xff63BBDA)))),
                            Center(
                                child: SizedBox(
                                  width: 15,
                                )),
                            Text(
                              "Kothamangalam",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(13, 4, 11, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Leaves on :",
                              style: TextStyle(
                                  color: Color(0xff63BBDA), fontSize: 15),
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              "18-04-2023",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w900),
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              "at:",
                              style: TextStyle(
                                  color: Color(0xff63BBDA), fontSize: 15),
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              "4:30 pm",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(13, 2, 11, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Arrives on :",
                              style: TextStyle(
                                  color: Color(0xff63BBDA), fontSize: 15),
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              "31-04-2023",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w900),
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              "at:",
                              style: TextStyle(
                                  color: Color(0xff63BBDA), fontSize: 15),
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              "4:30 pm",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            children: [
                              MaterialButton(
                                child: FakeText[index],
                                height: 33.12 ,
                                minWidth: 280,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(29.0),
                                ),
                                elevation: 0,

                                color:Colores[index], onPressed: () {  },
                              )],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                        ],
                      )
                    ],
                  )),
            ),
          );
        },
      )
    );
  }
}
