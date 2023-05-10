import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mini/User/userapplypass.dart';

import '../LoginPage.dart';
import 'UserPassHIstory.dart';

class UserHome extends StatefulWidget {
  final token;
  const UserHome({@required this.token,Key? key}) : super(key: key);

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  late String role;
  late String status;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Map<String,dynamic> jwtDecodedToken = JwtDecoder.decode(widget.token);
    role = jwtDecodedToken['role'];
    status = jwtDecodedToken['status'];
  }
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
          resizeToAvoidBottomInset: false,
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
                   "Hello",
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      role,
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
          body: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ApplyOutpass()),
                        );

                      },
                      child: Container(
                        width: 220,
                        height: 50,
                        decoration: BoxDecoration(color: Color(0xff215DA2),borderRadius: BorderRadius.circular(56),),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add_box,color: Colors.white),
                            SizedBox(width: 10,),
                            Text("Apply For new Outpass",style: TextStyle(fontSize: 12.57,color: Colors.white),)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 17,),
                    InkWell(
                      onTap: (){Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UserHistory()),
                      );},
                      child: Container(
                        width: 220,
                        height: 45,
                        decoration: BoxDecoration(color: Color(0xff215DA2),borderRadius: BorderRadius.circular(56),),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 22,),
                            Icon(Icons.document_scanner_outlined,color: Colors.white),
                            SizedBox(width: 21,),
                            Text("Outpass History",style: TextStyle(fontSize: 13.57,color: Colors.white))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 36,),
                  ],
                ),
              ],
            ),
          )),
    );

  }
}

