import 'dart:ui';
import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dismissible_tile/flutter_dismissible_tile.dart';
import 'package:ionicons/ionicons.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mini/Bloc/AdmnPullBloc.dart';
import 'package:mini/Bloc/RejectOpBloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Bloc/AcceptOpBloc.dart';
import '../Bloc/AdminHomeDataBloc.dart';
import 'AdminHeaderDrawer.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:intl/intl.dart';
class AdminHome extends StatefulWidget {
  const AdminHome( {Key? key}) : super(key: key);

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
  var token;
  late Map<String?, dynamic> decodedToken = {};
  bool isLoading = true;
  String admnname = "";
  Future<void> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    if (token != null) {
      decodedToken = await JwtDecoder.decode(token);
    }
    setState(() {
      isLoading = false;
    });
  }

  final AcceptOpBloc _AcceptOpBloc = AcceptOpBloc();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  AdminHomeDataBloc _AdminHomeDataBloc = new AdminHomeDataBloc();
  AdmnPullOpBloc _AdmnPullOpBloc = new AdmnPullOpBloc();
  @override
  void initState() {
    getToken();
    _AdminHomeDataBloc = BlocProvider.of<AdminHomeDataBloc>(context);
    _AdminHomeDataBloc.add(GetAdminHomeData());
    _AdmnPullOpBloc.add(AdmnPullPush());

  }

  Widget build(BuildContext context) {
    void _removeCard(int index) {
      setState(() {
        _cardDataList.removeAt(index);
      });
    }

    var change = new GreetingChanger.changer("Home");
    return BlocProvider(
      create: (_) => _AdmnPullOpBloc,
      child: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Color(0xffADE8F4),
            key: scaffoldKey,
            appBar: AdminAppbar(),
            drawer: AdminDrawer(),
            body: BlocConsumer<AdmnPullOpBloc, AdmnPullOpStates>(
              listener: (context, state) {
                if (state is AdmnPullOpSuccess) {
                  setState(() {
                    admnname = state.details.data![0].name!;
                  });
                }
              },
              builder: (context, state) {
                if (state is AdmnPullOpSuccess) {
                  return MultiBlocListener(
                    listeners: [
                      BlocListener<AcceptOpBloc, AcceptOpStates>(
                        listener: (context, state) {
                          if (state is AcceptOpLoading) {}
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
                          if (state is RejectOpLoading) {
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
                                "Some Error Occured",
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
                    child: BlocBuilder<AdminHomeDataBloc, AdminHomeDataStates>(
                            builder: (context, state) {
                              print(state);
                      if (state is AdminHomeDataLoaded) {
                        return ListView.builder(
                          itemCount: state.AdminHomeData.data?.length,
                          itemBuilder: (context, index) {
                            return SingleChildScrollView(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                                child: DismissibleTile(
                                  key: UniqueKey(),
                                  direction:
                                      DismissibleTileDirection.horizontal,
                                  onDismissed: (direction) {
                                    if (direction ==
                                        DismissibleTileDirection.leftToRight) {
                                      print('Swiped right');
                                      BlocProvider.of<RejectOpBloc>(context)
                                          .add(RejectPush(
                                              index: state.AdminHomeData.data![index].ad!, name: admnname));
                                    } else if (direction ==
                                        DismissibleTileDirection.rightToLeft) {
                                      print('Swiped left');
                                      BlocProvider.of<AcceptOpBloc>(context)
                                          .add(AcceptPush(
                                              index: state.AdminHomeData.data![index].ad!, name: admnname));
                                    }
                                  },
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(16)),
                                  delayBeforeResize:
                                      const Duration(milliseconds: 500),
                                  ltrBackground: const ColoredBox(
                                      color: Color(0xff023E8A)),
                                  rtlBackground: const ColoredBox(
                                      color: Color(0xff2B6AB9)),
                                  ltrDismissedColor: Color(0xffFE0944),
                                  rtlDismissedColor: const Color(0xff00ff56),
                                  ltrOverlay: Text("Reject"),
                                  ltrOverlayDismissed: const Text('Rejected'),
                                  rtlOverlay: const Text('Accept'),
                                  rtlOverlayDismissed: const Text(
                                      'Accepted'), //change it for demo purposes
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
                                          borderRadius:
                                              BorderRadius.circular(19.59)),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                13, 10, 11, 0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                 " ${state.AdminHomeData.data![index].user}",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      fontSize: 17),
                                                ),
                                                SizedBox(
                                                  width: 24,
                                                ),
                                                Text("${state.AdminHomeData.data![index].ad}",
                                                    style: TextStyle(
                                                        color: Colors.white)),
                                                SizedBox(
                                                  width: 9,
                                                ),
                                                Text("#${state.AdminHomeData.data![index].semester}",
                                                    style: TextStyle(
                                                        color: Colors.white)),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                13, 5, 11, 0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${state.AdminHomeData.data![index].purpose}",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                                Center(
                                                    child: SizedBox(
                                                  width: 15,
                                                )),
                                                Center(
                                                    child: Text("at",
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xff63BBDA)))),
                                                Center(
                                                    child: SizedBox(
                                                  width: 15,
                                                )),
                                                Text(
                                                  "${state.AdminHomeData.data![index].destination}",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                13, 4, 11, 0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Leaves on :",
                                                  style: TextStyle(
                                                      color: Color(0xff63BBDA),
                                                      fontSize: 15),
                                                ),
                                                SizedBox(
                                                  width: 2,
                                                ),
                                                Text(
                                                    DateConversion(state.AdminHomeData.data![index].dateofleaving),
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.w900),
                                                ),
                                                SizedBox(
                                                  width: 4,
                                                ),
                                                Text(
                                                  "at:",
                                                  style: TextStyle(
                                                      color: Color(0xff63BBDA),
                                                      fontSize: 15),
                                                ),
                                                SizedBox(
                                                  width: 4,
                                                ),
                                                Text(
                                                    TimeConversion(state.AdminHomeData.data![index].dateofleaving),
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.w900),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                13, 2, 11, 0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Arrives on :",
                                                  style: TextStyle(
                                                      color: Color(0xff63BBDA),
                                                      fontSize: 15),
                                                ),
                                                SizedBox(
                                                  width: 3,
                                                ),
                                                Text(
                                                  DateConversion(state.AdminHomeData.data![index].dateofreturn),
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.w900),
                                                ),
                                                SizedBox(
                                                  width: 4,
                                                ),
                                                Text(
                                                  "at:",
                                                  style: TextStyle(
                                                      color: Color(0xff63BBDA),
                                                      fontSize: 15),
                                                ),
                                                SizedBox(
                                                  width: 4,
                                                ),
                                                Text(
                                                  TimeConversion(state.AdminHomeData.data![index].dateofreturn),
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.w900),
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
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 12,
                                                        ),
                                                        Text("Reject",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w900,
                                                                fontSize: 16,
                                                                color: Color(
                                                                    0xfffa2828))),
                                                        Icon(
                                                          Ionicons
                                                              .arrow_forward_outline,
                                                          color:
                                                              Color(0xfffa2828),
                                                        ),
                                                      ],
                                                    ),
                                                    Text(
                                                      "Swipe",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w900,
                                                          fontSize: 16,
                                                          color:
                                                              Colors.white60),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Icon(
                                                          Ionicons
                                                              .arrow_back_outline,
                                                          color:
                                                              Color(0xff00ff56),
                                                        ),
                                                        Text(
                                                          "Accept",
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w900,
                                                            fontSize: 16,
                                                            color: Color(
                                                                0xff00ff56),
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
                        );
                      }
                      else if(state is AdminHomeDataError){
                        return Center(child: Text("No pending Outpasses"));
                      }
                      else {
                        return Center(child: Text("No pending Outpasses"));
                      }
                    }),
                  );
                } else {
                  return Center(
                      child: LoadingAnimationWidget.flickr(
                          leftDotColor: Colors.white,
                          rightDotColor: Colors.indigo,
                          size: 30));
                }
              },
            )),
      ),
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
String DateConversion(String? a) {
  DateTime dateTime = DateTime.parse(a!);
  String formattedDate = DateFormat('dd-MM-yyyy').format(dateTime);
  return formattedDate;
}
String TimeConversion(String? a) {
  DateTime dateTime = DateTime.parse(a!);
  String formattedTime = DateFormat('hh:mm a').format(dateTime);
  return formattedTime;
}