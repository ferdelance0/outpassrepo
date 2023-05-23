import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

import 'UserTaskbar.dart';

class UserOutPassDetailed extends StatefulWidget {
  const UserOutPassDetailed({Key? key}) : super(key: key);

  @override
  State<UserOutPassDetailed> createState() => _UserOutPassDetailedState();
}

class _UserOutPassDetailedState extends State<UserOutPassDetailed> {
  @override
  bool _showImage = false;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffADE8F4),
      resizeToAvoidBottomInset: false,
      appBar: UserAppbar(name: "name",pgtitle: "Outpass Detailed",),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    _showImage = true;
                  });
                },
                child: Visibility(
                  visible: _showImage,
                  child:  Container(
                    width: 1000,
                    height: 528,
                    decoration: BoxDecoration(
                        color: Color(0xff215DA2),
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          PrettyQr(
                            elementColor: Colors.white,
                            size: 200,
                            data: '12441',
                            errorCorrectLevel: QrErrorCorrectLevel.M,
                            typeNumber: null,
                            roundEdges: true,
                          ),
                          SizedBox(height: 10,),
                          Text("Scan the QR",style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18
                          ),)
                        ],
                      ),
                    ),
                  ),
                  replacement:InkWell(
                    onTap: () {
        setState(() {
        _showImage = false;
        });
        },
          child: Container(
            width: 1000,
            height: 528,
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
                      SizedBox(
                        width: 5,
                      ),
                      Icon(Icons.file_download, color: Colors.blue),
                    ],
                  ),
                  SizedBox(
                    width: 50,
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
                  SizedBox(height: 20),
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
                  )
                ],
              ),
            ),
          ),
        ),
                ),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.pop(
                    context,
                  );
                },
                child: Text(
                  "Cancel Outpass",
                  style: TextStyle(
                    color: Color(0xff760000),
                  ),
                ),
                color: Color(0xffFD5C5C),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(23)),
                elevation: 0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
