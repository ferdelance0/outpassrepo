import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:switcher_button/switcher_button.dart';

import '../Bloc/DetailsBloc.dart';

class SecurityCheck extends StatefulWidget {

  final String scannedText;
  const SecurityCheck({Key? key,required this.scannedText}) : super(key: key);@override
  State<SecurityCheck> createState() => _SecurityCheckState();

}


class _SecurityCheckState extends State<SecurityCheck> {
  @override
  void initState() {
  }
  @override
  String _presence="Present";
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0
      ),
      backgroundColor: Color(0xffADE8F4),
      resizeToAvoidBottomInset: false,
      body: Center(
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
                            "12-03-2023",
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
                        "Don C Delish",
                        style: TextStyle(
                            color: Color(0xffFFFFFF),
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      Text(
                        "12441",
                        style: TextStyle(
                            color: Color(0xffFFFFFF),
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      Text(
                        "S6 Information Technology",
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
                        "Konni Pathanamthitta",
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
                        "Home Visit",
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
                        "12-04-2023 4:30pm",
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
                        "13-04-2023 7:30pm",
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
                            "Approved by AdminName",
                            style: TextStyle(
                              color: Color(0xff206500),
                            ),
                          ),
                          color: Color(0xff7EEC58),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(23)),
                          elevation: 0,
                        ),
                      ),


                    ],
                  ),
                ),
              ),
              SizedBox(height: 25,),
              Text("Student Status $_presence",style: TextStyle(
                fontSize: 18,
                color: Color(0xff206500),
              ),),

              SizedBox(height: 15,),              SwitcherButton(
                onColor: Colors.greenAccent,
                offColor: Colors.redAccent,
                value: true,
                size: 75,
                onChange: (value) {
                  if(value==true)
                    setState(() {
                      _presence = 'Present';
                    });
                  else
                    setState(() {
                      _presence = 'Absent';
                    });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
