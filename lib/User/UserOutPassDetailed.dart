import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mini/Admin/AdminAddStudents.dart';
import 'package:mini/models/LatestOpModel.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:intl/intl.dart';
import '../Bloc/DeleteOpBloc.dart';
import '../Bloc/LatestOpBloc.dart';
import 'UserTaskbar.dart';

class UserOutPassDetailed extends StatefulWidget {
  final String? name, semester;
  final int? ad;

  const UserOutPassDetailed({Key? key, this.name, this.ad, this.semester})
      : super(key: key);

  @override
  State<UserOutPassDetailed> createState() => _UserOutPassDetailedState();
}

class _UserOutPassDetailedState extends State<UserOutPassDetailed> {
  bool _showQr = false;
  bool fer = true;
  final LatestOpBloc _latestOpBloc = new LatestOpBloc();
  final DeleteBloc _DeleteBloc = new DeleteBloc();
  @override
  void initState() {
    // TODO: implement initState
    _latestOpBloc.add(GetLatestDetails());
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffADE8F4),
      resizeToAvoidBottomInset: false,
      appBar: UserAppbar(
        name: widget.name,
        pgtitle: "Outpass Detailed",
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    _showQr = !_showQr;
                  });
                },
                child: Visibility(
                  visible: !_showQr,
                  child: Container(
                    width: 1000,
                    height: 528,
                    decoration: BoxDecoration(
                      color: Color(0xff215DA2),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          PrettyQr(
                            elementColor: Colors.white,
                            size: 200,
                            data: widget.ad.toString(),
                            errorCorrectLevel: QrErrorCorrectLevel.M,
                            typeNumber: null,
                            roundEdges: true,
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Scan the QR",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  replacement: BlocProvider<LatestOpBloc>(
                      create: (_) => _latestOpBloc,
                      child: BlocListener<LatestOpBloc, LatestOpStates>(
                        listener: (context, state) => {},
                        child: BlocBuilder<LatestOpBloc, LatestOpStates>(
                          builder: (context, state) {
                            if (state is LatestLoading) {
                              return Container(
                                  width: 1000,
                                  height: 528,
                                  decoration: BoxDecoration(
                                    color: Color(0xff215DA2),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Center(
                                      child: LoadingAnimationWidget
                                          .staggeredDotsWave(
                                              color: Colors.white, size: 50)));
                            } else if (state is LatestError) {
                              return Container(
                                width: 1000,
                                height: 528,
                                decoration: BoxDecoration(
                                  color: Color(0xff215DA2),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Text(
                                    "Error jas Occured while retrieving info"),
                              );
                            } else if (state is LatestLoaded) {
                              if(state.Details.status == "Expired"){
                                setState(() {
                                  fer = false;
                                });
                              }
                              return _buildLoad(state.Details,
                                  name: widget.name,
                                  ad: widget.ad,
                                  semester: widget.semester);
                            } else {
                              return Text("404");
                            }
                          },
                        ),
                      )),
                ),
              ),
              MaterialButton(
                onPressed: () {
                  _DeleteBloc.add(GetDelete());
                },
                child: BlocProvider<DeleteBloc>(
                    create: (_) => _DeleteBloc,
                    child: BlocListener<DeleteBloc, DeleteStates>(
                      listener: (context, state) async => {
                        if (state is DeleteLoaded)
                          {
                            CherryToast.success(
                              title: Text(''),
                              enableIconAnimation: false,
                              displayTitle: false,
                              description: Text(
                                'Invalid account information',
                                style: TextStyle(fontSize: 12),
                              ),
                              toastPosition: Position.bottom,
                              animationDuration: Duration(milliseconds: 500),
                              toastDuration: Duration(milliseconds: 1500),
                              autoDismiss: true,
                            ).show(context),
                            await Future.delayed(
                                Duration(milliseconds: 2000)),
                            Navigator.pop(context),
                          }
                      },
                      child: BlocBuilder<DeleteBloc, DeleteStates>(
                        builder: (context, state) {
                          if (state is DeleteLoading) {
                            return LoadingAnimationWidget.staggeredDotsWave(
                              color: Colors.white,
                              size: 30,
                            );
                          } else {
                            return Text("Cancel Outpass",
                                style: TextStyle(
                                  color: Color(0xff760000),
                                ));
                          }
                        },
                      ),
                    )),
                color: Color(0xffFD5C5C),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(23),
                ),
                elevation: 0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildLoad(LatestOpModel details,
    {String? name, int? ad, String? semester}) {
  return Container(
    width: 1000,
    height: 528,
    decoration: BoxDecoration(
      color: Color(0xff215DA2),
      borderRadius: BorderRadius.circular(30),
    ),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Outpass",
                style: TextStyle(
                  color: Color(0xffFFFFFF),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(width: 18),
              Text(
                "for",
                style: TextStyle(
                  color: Color(0xff63BBDA),
                  fontSize: 20.7,
                ),
              ),
              SizedBox(width: 40),
              Text(
                "Applied on",
                style: TextStyle(
                  color: Color(0xffFFFFFF),
                  fontSize: 16,
                ),
              ),
              SizedBox(width: 5),
            ],
          ),
          SizedBox(width: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                DateConversion(details.data1!.createDate),
                style: TextStyle(
                  color: Color(0xffFFFFFF),
                  fontSize: 19.56,
                ),
              ),
              SizedBox(width: 20),
            ],
          ),
          SizedBox(height: 20),
          Text(
            name!,
            style: TextStyle(
              color: Color(0xffFFFFFF),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Text(
            "${ad}",
            style: TextStyle(
              color: Color(0xffFFFFFF),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Text(
            "${semester}",
            style: TextStyle(
              color: Color(0xffFFFFFF),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Destination:",
            style: TextStyle(
              color: Color(0xffFFFFFF),
              fontWeight: FontWeight.normal,
              fontSize: 18,
            ),
          ),
          Text(
            "${details.data1?.destination}",
            style: TextStyle(
              color: Color(0xffFFFFFF),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Text(
            "Purpose:",
            style: TextStyle(
              color: Color(0xffFFFFFF),
              fontWeight: FontWeight.normal,
              fontSize: 18,
            ),
          ),
          Text(
            "${details.data1?.purpose}",
            style: TextStyle(
              color: Color(0xffFFFFFF),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Date and Time of Leaving",
            style: TextStyle(
              color: Color(0xffFFFFFF),
              fontWeight: FontWeight.normal,
              fontSize: 18,
            ),
          ),
          Text(
            "${DateConversion(details.data1?.dateofleaving)} on ${TimeConversion(details.data1?.dateofleaving)}",
            style: TextStyle(
              color: Color(0xffFFFFFF),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Text(
            "Date and Time of Return",
            style: TextStyle(
              color: Color(0xffFFFFFF),
              fontWeight: FontWeight.normal,
              fontSize: 18,
            ),
          ),
          Text(
            "${DateConversion(details.data1?.dateofreturn)} on ${TimeConversion(details.data1?.dateofreturn)}",
            style: TextStyle(
              color: Color(0xffFFFFFF),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: MaterialButton(
              onPressed: () {},
              child: Text(
                StatusDetec(details.data1?.opStatus,details.data1?.admin ),
                style: TextStyle(color: ColorDetec1(details.data1?.opStatus)),
              ),
              color: ColorDetec(details.data1?.opStatus),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(23),
              ),
              elevation: 0,
            ),
          ),
        ],
      ),
    ),
  );
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

Color ColorDetec(String? a) {
  if (a == "Pending") {
    return Color(0xffABBDD3);
  } else if (a == "Approved") {
    return Color(0xff7EEC58);
  } else if (a == "Rejected") {
    return Color(0xffFD5C5C);
  } else {
    return Color(0xff002087);
  }
}
String StatusDetec(String? a, String? b){
  if (a == "Pending") {
    return "Pending";
  } else if (a == "Approved") {
    return "Approved by $b";
  } else if (a == "Rejected") {
    return "Rejected by $b";
  } else {
    return "Dummy";
  }
}
Color ColorDetec1(String? a) {
  if (a == "Pending") {
    return Color(0xff515a65);
  } else if (a == "Approved") {
    return Color(0xff437e2e);
  } else if (a == "Rejected") {
    return Color(0xff702727);
  } else {
    return Color(0xff202a4b);
  }
}
