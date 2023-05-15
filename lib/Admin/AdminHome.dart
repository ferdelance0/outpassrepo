import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dismissible_tile/flutter_dismissible_tile.dart';
import 'package:ionicons/ionicons.dart';
import 'AdminHeaderDrawer.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
AcceptingRequest(){
  print("map");
}
class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

List<String> _cardDataList = [
  "Don C Delish",
  "Neha Elsa Thomas",
  "Elias T Kurian",
  "Midhun Krishna",
];

class _AdminHomeState extends State<AdminHome> {
  @override
  final scaffoldKey = GlobalKey<ScaffoldState>();
  Widget build(BuildContext context) {
    void _removeCard(int index) {
      setState(() {
        _cardDataList.removeAt(index);
      });
    }

    var change = new GreetingChanger.changer("Home");
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Color(0xffADE8F4),
          key: scaffoldKey,
          appBar: AdminAppbar(),
          drawer: AdminDrawer(),
          body: ListView.builder(
            itemCount: _cardDataList.length,
            itemBuilder: (context, index) {
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: DismissibleTile(
                    key: UniqueKey(),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    delayBeforeResize: const Duration(milliseconds: 500),
                    ltrBackground: const ColoredBox(color: Color(0xff023E8A)),
                    rtlBackground: const ColoredBox(color: Color(0xff2B6AB9)),
                    ltrDismissedColor: Color(0xffFE0944),
                    rtlDismissedColor: const Color(0xff00ff56),
                    ltrOverlay: AcceptReq(ab: index.toString()) ,
                    ltrOverlayDismissed: const Text('Added'),
                    rtlOverlay: const Text('Delete'),
                    rtlOverlayDismissed: const Text('Deleted'),//change it for demo purposes
                    onDismissed: (direction) => {
                      {
                        if (direction == DismissDirection.startToEnd)
                          {
                            // Code for right swipe
                            print('Swiped right $index')
                          }
                        else if (direction == DismissDirection.endToStart)
                          {
                            // Code for left swipe
                            print('Swiped left $index')
                          }
                      }
                    },
                    // background: Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(21),
                    //       color: Color(0xffFE0944),
                    //     ),
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.start,
                    //       children: [
                    //         Center(
                    //             child: Padding(
                    //           padding: const EdgeInsets.all(18.0),
                    //           child: Text(
                    //             "Reject request",
                    //             style: TextStyle(
                    //                 color: Colors.white,
                    //                 fontSize: 15,
                    //                 fontWeight: FontWeight.bold),
                    //           ),
                    //         )),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    // secondaryBackground: Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(21),
                    //         color: Color(0xff00ff56)),
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.end,
                    //       children: [
                    //         Center(
                    //             child: Padding(
                    //           padding: const EdgeInsets.all(18.0),
                    //           child: Text(
                    //             "Accept request",
                    //             style: TextStyle(
                    //                 color: Colors.white,
                    //                 fontSize: 15,
                    //                 fontWeight: FontWeight.bold),
                    //           ),
                    //         )),
                    //       ],
                    //     ),
                    //   ),
                    // ),

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
                              padding: const EdgeInsets.fromLTRB(13, 10, 11, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    _cardDataList[index],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 17),
                                  ),
                                  SizedBox(
                                    width: 24,
                                  ),
                                  Text("# 13041",
                                      style: TextStyle(color: Colors.white)),
                                  SizedBox(
                                    width: 9,
                                  ),
                                  Text("# S6 IT",
                                      style: TextStyle(color: Colors.white)),
                                ],
                              ),
                            ),
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
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 12,
                                          ),
                                          Text("Reject",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: 16,
                                                  color: Color(0xfffa2828))),
                                          Icon(
                                            Ionicons.arrow_forward_outline,
                                            color: Color(0xfffa2828),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "Swipe",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            fontSize: 16,
                                            color: Colors.white60),
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Ionicons.arrow_back_outline,
                                            color: Color(0xff00ff56),
                                          ),
                                          Text(
                                            "Accept",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w900,
                                              fontSize: 16,
                                              color: Color(0xff00ff56),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 12,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                ],
                              ),
                            )
                          ],
                        )),
                  ),
                ),
              );
            },
          )
      ),
    );
  }
}
class AcceptReq extends StatelessWidget {
  final  ab;
  const AcceptReq({Key? key,this.ab}) : super(key: key);
  @override
  void pritn(){print("slkdnf");}
  Widget build(BuildContext context) {
    pritn();
    return Text(ab );
  }
}
