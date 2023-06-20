import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mini/Bloc/SecLopBloc.dart';
import 'package:switcher_button/switcher_button.dart';

import '../Bloc/DetailsBloc.dart';
import '../Bloc/SecVerifBloc.dart';
import 'SecurityHome.dart';
import 'package:intl/intl.dart';

class SecurityCheck extends StatefulWidget {
  final String scannedText;
  const SecurityCheck({Key? key, required this.scannedText}) : super(key: key);
  @override
  State<SecurityCheck> createState() => _SecurityCheckState();
}

class _SecurityCheckState extends State<SecurityCheck> {
  @override
  bool show = false;
  void initState() {
    BlocProvider.of<SecLopBloc>(context).add(GetSecLop(widget.scannedText));
  }

  @override
  String _presence = "Present";
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              BlocProvider.of<SecLopBloc>(context).add(GetSecLopInitial());
              BlocProvider.of<SecVerifBloc>(context).add(GetSecInitial());
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => QRCodeScannerPage()),
              );
            },
          )),
      backgroundColor: Color(0xffADE8F4),
      resizeToAvoidBottomInset: false,
      body: BlocBuilder<SecLopBloc, SecLopStates>(builder: (context, state) {
        if (state is SecLopLoaded) {
          if (state.SecLop.data1?.opStatus == "Approved") {
            show = true;
          }
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 1000,
                    height: 518,
                    decoration: BoxDecoration(
                        color: Color(0xff215DA2),
                        borderRadius: BorderRadius.circular(30)),
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
                                    fontSize: 20),
                              ),
                              SizedBox(
                                width: 18,
                              ),
                              Text(
                                "for",
                                style: TextStyle(
                                    color: Color(0xff63BBDA), fontSize: 20.7),
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              Text(
                                "Applied on",
                                style: TextStyle(
                                    color: Color(0xffFFFFFF), fontSize: 16),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                DateConversion(
                                    "${state.SecLop.data1?.createdAt}"),
                                style: TextStyle(
                                  color: Color(0xffFFFFFF),
                                  fontSize: 19.56,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              )
                            ],
                          ),
                          SizedBox(height: 5),
                          Text(
                            "${state.SecLop.data1?.user}",
                            style: TextStyle(
                                color: Color(0xffFFFFFF),
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Text(
                            "${state.SecLop.data1?.ad}",
                            style: TextStyle(
                                color: Color(0xffFFFFFF),
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Text(
                            "${state.SecLop.data1?.semester}",
                            style: TextStyle(
                                color: Color(0xffFFFFFF),
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Destination:",
                            style: TextStyle(
                                color: Color(0xffFFFFFF),
                                fontWeight: FontWeight.normal,
                                fontSize: 18),
                          ),
                          Text(
                            "${state.SecLop.data1?.destination}",
                            style: TextStyle(
                                color: Color(0xffFFFFFF),
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Text(
                            "Purpose:",
                            style: TextStyle(
                                color: Color(0xffFFFFFF),
                                fontWeight: FontWeight.normal,
                                fontSize: 18),
                          ),
                          Text(
                            "${state.SecLop.data1?.purpose}",
                            style: TextStyle(
                                color: Color(0xffFFFFFF),
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Date and Time of Leaving",
                            style: TextStyle(
                                color: Color(0xffFFFFFF),
                                fontWeight: FontWeight.normal,
                                fontSize: 18),
                          ),
                          Text(
                            " ${DateConversion(state.SecLop.data1?.dateofleaving)} ${TimeConversion(state.SecLop.data1?.dateofleaving)}",
                            style: TextStyle(
                                color: Color(0xffFFFFFF),
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Text(
                            "Date and Time of Return",
                            style: TextStyle(
                                color: Color(0xffFFFFFF),
                                fontWeight: FontWeight.normal,
                                fontSize: 18),
                          ),
                          Text(
                            " ${DateConversion(state.SecLop.data1?.dateofreturn)} ${TimeConversion(state.SecLop.data1?.dateofreturn)}",
                            style: TextStyle(
                                color: Color(0xffFFFFFF),
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          SizedBox(height: 20),
                          Center(
                            child: MaterialButton(
                              onPressed: () {},
                              child: Text(
                                StatusDetec("${state.SecLop.data1?.opStatus}",
                                    "${state.SecLop.data1?.admin}"),
                                style: TextStyle(
                                  color: ColorDetec1(
                                      "${state.SecLop.data1?.opStatus}"),
                                ),
                              ),
                              color:
                                  ColorDetec("${state.SecLop.data1?.opStatus}"),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(23)),
                              elevation: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Visibility(
                    visible: show,
                    child: MaterialButton(
                      height: 43.12,
                      minWidth: 133.62,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(29.0),
                      ),
                      elevation: 0,
                      color: Color(0xff03045E),
                      onPressed: () {
                        // setState(() {
                        //   show = false;
                        // });
                        print(widget.scannedText);
                        BlocProvider.of<SecVerifBloc>(context)
                            .add(GetSecVerif(widget.scannedText));
                        setState(() {
                          _presence = "Absent";
                        });
                      },
                      child: BlocBuilder<SecVerifBloc, SecVerifStates>(
                          builder: (context, state) {
                        if (state is SecVerifLoading) {
                          return Center(
                              child: LoadingAnimationWidget.flickr(
                                  leftDotColor: Colors.white,
                                  rightDotColor: Colors.indigo,
                                  size: 30));
                        }
                        else if (state is SecVerifLoaded) {
                          return Text(
                            "Expired",
                            style: TextStyle(color: Colors.white),
                          );
                        } else {
                          return Text(
                            "Tap To Expire",
                            style: TextStyle(color: Colors.white),
                          );
                        }
                      }),
                    ),
                  )
                ],
              ),
            ),
          );
        }
        else{
          return Center(child: Text("No Outpass in this admision no"));
        }
      }),
    );
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

String StatusDetec(String? a, String? b) {
  print(a);
  if (a == "Pending") {
    return "Pending";
  } else if (a == "Approved") {
    return "Approved by $b";
  } else if (a == "Rejected") {
    return "Rejected by $b";
  } else if (a == "Expired") {
    return "Expired Outpass";
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
