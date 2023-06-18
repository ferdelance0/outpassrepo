import 'dart:ui';
import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dismissible_tile/flutter_dismissible_tile.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mini/Bloc/RejectOpBloc.dart';
import '../Bloc/AcceptOpBloc.dart';
import 'AdminHeaderDrawer.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

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
  final AcceptOpBloc _AcceptOpBloc = AcceptOpBloc();
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
          body: MultiBlocListener(
            listeners: [
              BlocListener<AcceptOpBloc, AcceptOpStates>(
                listener: (context, state) {
                  if(state is AcceptOpLoading){
                    print("the duck");
                  }
                  if (state is AcceptOpSuccess) {
                    print("");
                    CherryToast.success(
                      title: Text(''),
                      enableIconAnimation: false,
                      displayTitle: false,
                      description: Text(
                        "Outpass Accepted",
                        style: TextStyle(fontSize: 12),
                      ),
                      toastPosition: Position.bottom,
                      animationDuration: Duration(milliseconds: 500),
                      toastDuration: Duration(milliseconds: 1500),
                      autoDismiss: true,
                    ).show(context);
                  } else if (state is AcceptOpError) {
                    CherryToast.error(
                      title: Text(''),
                      enableIconAnimation: false,
                      displayTitle: false,
                      description: Text(
                        state.error!,
                        style: TextStyle(fontSize: 12),
                      ),
                      toastPosition: Position.bottom,
                      animationDuration: Duration(milliseconds: 500),
                      toastDuration: Duration(milliseconds: 1500),
                      autoDismiss: true,
                    ).show(context);
                  }
                },
              ),
              BlocListener<RejectOpBloc, RejectOpStates>(
                listener: (context, state) {
                  if(state is RejectOpLoading){
                    print("the duck");
                  }
                  if (state is RejectOpSuccess) {
                    print("");
                    CherryToast.success(
                      title: Text(''),
                      enableIconAnimation: false,
                      displayTitle: false,
                      description: Text(
                        "Outpass Rejected",
                        style: TextStyle(fontSize: 12),
                      ),
                      toastPosition: Position.bottom,
                      animationDuration: Duration(milliseconds: 500),
                      toastDuration: Duration(milliseconds: 1500),
                      autoDismiss: true,
                    ).show(context);
                  } else if (state is AcceptOpError) {
                    CherryToast.error(
                      title: Text(''),
                      enableIconAnimation: false,
                      displayTitle: false,
                      description: Text(
                 "Error aane",
                        style: TextStyle(fontSize: 12),
                      ),
                      toastPosition: Position.bottom,
                      animationDuration: Duration(milliseconds: 500),
                      toastDuration: Duration(milliseconds: 1500),
                      autoDismiss: true,
                    ).show(context);
                  }
                },
              )
            ],
            child: ListView.builder(
              itemCount: _cardDataList.length,
              itemBuilder: (context, index) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: DismissibleTile(
                      key: UniqueKey(),
                      direction: DismissibleTileDirection.horizontal,
                      onDismissed: (direction) {
                        if (direction == DismissibleTileDirection.leftToRight) {
                          print('Swiped right');
                          BlocProvider.of<RejectOpBloc>(context).add(RejectPush(index: index, name: "Fr"));
                        } else if (direction ==
                            DismissibleTileDirection.rightToLeft) {
                          print('Swiped left');
                          BlocProvider.of<AcceptOpBloc>(context).add(AcceptPush(index: index, name: "Fr"));
                        }
                      },
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      delayBeforeResize: const Duration(milliseconds: 500),
                      ltrBackground: const ColoredBox(color: Color(0xff023E8A)),
                      rtlBackground: const ColoredBox(color: Color(0xff2B6AB9)),
                      ltrDismissedColor: Color(0xffFE0944),
                      rtlDismissedColor: const Color(0xff00ff56),
                      ltrOverlay: Text("Reject"),
                      ltrOverlayDismissed: const Text('Rejected'),
                      rtlOverlay: const Text('Accept'),
                      rtlOverlayDismissed:
                          const Text('Accepted'), //change it for demo purposes
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
                                padding:
                                    const EdgeInsets.fromLTRB(13, 10, 11, 0),
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
                                padding:
                                    const EdgeInsets.fromLTRB(13, 5, 11, 0),
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
                                padding:
                                    const EdgeInsets.fromLTRB(13, 4, 11, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Leaves on :",
                                      style: TextStyle(
                                          color: Color(0xff63BBDA),
                                          fontSize: 15),
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
                                          color: Color(0xff63BBDA),
                                          fontSize: 15),
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
                                padding:
                                    const EdgeInsets.fromLTRB(13, 2, 11, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Arrives on :",
                                      style: TextStyle(
                                          color: Color(0xff63BBDA),
                                          fontSize: 15),
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
                                          color: Color(0xff63BBDA),
                                          fontSize: 15),
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
            ),
          )),
    );
  }
}

class AcceptReq extends StatelessWidget {
  final ab;
  const AcceptReq({Key? key, this.ab}) : super(key: key);
  @override
  Future<void> pritn() async {
    await Future.delayed(Duration(seconds: 9));
    print("slkdnf");
  }

  Widget build(BuildContext context) {
    return Text(ab);
  }
}
