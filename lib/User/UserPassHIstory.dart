import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mini/Bloc/OpDetailsBloc.dart';
import '../Admin/AdminAddStudents.dart';
import '../models/OpDetailsModel.dart';
import 'UserOutPassDetailed.dart';
import 'UserTaskbar.dart';
import 'package:intl/intl.dart';

class UserHistory extends StatefulWidget {
  final String? name;
  final int? ad;
  final String? semester;

  const UserHistory(
      {Key? key, required this.ad, required this.name, required this.semester})
      : super(key: key);

  @override
  State<UserHistory> createState() => _UserHistoryState();
}

class _UserHistoryState extends State<UserHistory> {
  final OpDetailsBloc _OpDetailsBloc = new OpDetailsBloc();
  @override
  void initState() {
    // TODO: implement initState
    _OpDetailsBloc.add(AllOpDetailsPull());
  }

  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xffADE8F4),
        appBar: UserAppbar(
          name: widget.name,
          pgtitle: "Outpass History",
        ),
        body: buildListDetails());
  }

  Widget buildListDetails() {
    return RefreshIndicator(
      onRefresh: () async {
        _OpDetailsBloc.add(AllOpDetailsPull());
      },
      child: Container(
        child: BlocProvider<OpDetailsBloc>(
          create: (_) => _OpDetailsBloc,
          child: BlocListener<OpDetailsBloc, OpDetailsStates>(
            listener: (context, state) => {},
            child: BlocBuilder<OpDetailsBloc, OpDetailsStates>(
              builder: (context, state) {
                if (state is OpDetailsInitial) {
                  return Center(
                      child: LoadingAnimationWidget.fallingDot(
                          color: Colors.white, size: 60));
                } else if (state is OpDetailsLoading) {
                  return Center(
                      child: LoadingAnimationWidget.fallingDot(
                          color: Colors.red, size: 60));
                } else if (state is OpDetailsSuccess) {
                  return _buildCard(context, state.details, widget.name,
                      widget.semester, widget.ad);
                } else {
                  return Center(child: Text("No Outpass History"));
                }
                ;
              },
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildCard(BuildContext context, OpDetailsModel Details, String? name,
    semester, int? ad) {
  Color color = Color(0xff7EEC58);
  bool permit = true;
  return ListView.builder(
    reverse: true,
    shrinkWrap: true,
    primary: false,
    itemCount: Details.d2?.reversed.length,
    itemBuilder: (context, index) {
      print(
        Details.d2?.reversed.length,
      );
      int lastindex = Details.d2?.reversed.length ?? 0;
      if (Details.d2?[index].opStatus == "Pending") {
        color = Color(0xffABBDD3);
      } else if (Details.d2?[index].opStatus == "Approved") {
        color = Color(0xff7EEC58);
      } else if (Details.d2?[index].opStatus == "Rejected") {
        color = Color(0xffFD5C5C);
      } else if (Details.d2?[index].opStatus == "Expired") {
        color = Color(0xff374a83);
        permit = false;
      } else {
        color = Color(0xffffffff);
      }
      DateTime LeavingdateTime =
          DateTime.parse("${Details.d2![index].dateofleaving}");
      String LeavingformattedDate =
          DateFormat('yyyy-MM-dd').format(LeavingdateTime);
      String LeavingformattedTime = DateFormat('HH:mm').format(LeavingdateTime);

      DateTime ReturningdateTime =
          DateTime.parse("${Details.d2![index].dateofreturn}");
      String ReturningformattedDate =
          DateFormat('yyyy-MM-dd').format(ReturningdateTime);
      String ReturningformattedTime =
          DateFormat('HH:mm').format(ReturningdateTime);

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
                          " ${Details.d2?[index].purpose}",
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
                                style: TextStyle(color: Color(0xff63BBDA)))),
                        Center(
                            child: SizedBox(
                          width: 15,
                        )),
                        Text(
                          "${Details.d2![index].destination}",
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
                          style:
                              TextStyle(color: Color(0xff63BBDA), fontSize: 15),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text(
                          LeavingformattedDate,
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
                          style:
                              TextStyle(color: Color(0xff63BBDA), fontSize: 15),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text(
                          LeavingformattedTime,
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
                          style:
                              TextStyle(color: Color(0xff63BBDA), fontSize: 15),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text(
                          ReturningformattedDate,
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
                          style:
                              TextStyle(color: Color(0xff63BBDA), fontSize: 15),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text(
                          LeavingformattedTime,
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MaterialButton(
                            child: Text("${Details.d2?[index].opStatus}"),
                            height: 33.12,
                            minWidth: 280,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(29.0),
                            ),
                            elevation: 0,
                            color: color,
                            onPressed: () {
                              if (index == lastindex - 1) {
                                {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              UserOutPassDetailed(
                                                  name: name,
                                                  ad: ad,
                                                  semester: semester)));
                                }
                              }
                            },
                          )
                        ],
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
      color = Color(0xffffff);
    },
  );
}
