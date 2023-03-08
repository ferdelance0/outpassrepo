import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'AdminHeaderDrawer.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override


  final scaffoldKey = GlobalKey<ScaffoldState>();
  Widget build(BuildContext context) {
    List<String> _cardDataList = [
      "MIrian","Honey sing","Money Money","Habiibi",
          
    ];
    void _removeCard(int index) {
      setState(() {
        _cardDataList.removeAt(index);
      });
    }
    var change = new GreetingChanger.changer("Home");
    return Scaffold(

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
              padding:  EdgeInsets.fromLTRB(20,10,20,0),
              child: Dismissible(

                key: Key(_cardDataList[index]),
                onDismissed: (direction) => {{
                  if (direction == DismissDirection.startToEnd) {
                // Code for right swipe
                print('Swiped right')
          } else if (direction == DismissDirection.endToStart) {
            // Code for left swipe
            print('Swiped left')
          }
        }
                },
                background: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(21),color: Color(0xffFE0944),),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Center(child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text("Reject request",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                        )),
                      ],
                    ),),
                ),
                secondaryBackground: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(21),color: Colors.greenAccent),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Center(child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text("Accept request",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                        )),
                      ],
                    ),
                  ),
                ),

                child: Container(

                  decoration: BoxDecoration(gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xff023E8A),
                      Color(0xff2B6AB9),
                    ],
                  ),
                    borderRadius: BorderRadius.circular(19.59)
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(13,10,11,0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(_cardDataList[index],style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 20),),
                            SizedBox(width: 24,),
                            Text("# 13041",style: TextStyle(color: Colors.white)),
                            SizedBox(width: 9,),
                            Text("# S6 IT",style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(13,5,11,0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Home Visit",style: TextStyle(color: Colors.white,fontSize: 15 ,fontWeight: FontWeight.w700),),
                            Center(child: SizedBox(width: 15,)),
                            Center(child: Text("at",style: TextStyle(color: Color(0xff63BBDA)))),
                            Center(child: SizedBox(width: 15,)),
                            Text("Kothamangalam",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w700 ),),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(13,4,11,0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Leaves on :",style: TextStyle(color: Color(0xff63BBDA),fontSize: 15 ),),
                            SizedBox(width: 7,),
                            Text("18-04-2023",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w900 ),),
                            SizedBox(width: 7,),
                            Text("at:",style: TextStyle(color: Color(0xff63BBDA),fontSize: 15 ),),
                            SizedBox(width: 7,),
                            Text("4:30 pm",style: TextStyle(color: Colors.white,fontSize: 17 ,fontWeight: FontWeight.w900),),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(13,2,11,0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Arrives on :",style: TextStyle(color: Color(0xff63BBDA),fontSize: 15 ),),
                            SizedBox(width: 7,),
                            Text("31-04-2023",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w900 ),),
                            SizedBox(width: 7,),
                            Text("at:",style: TextStyle(color: Color(0xff63BBDA),fontSize: 15 ),),
                            SizedBox(width: 7,),
                            Text("4:30 pm",style: TextStyle(color: Colors.white,fontSize: 17 ,fontWeight: FontWeight.w900),),
                          ],
                        ),
                      ),
                      SizedBox(height: 8,),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(Ionicons.arrow_back_outline,color: Color(0xff00ff56),),
                                GradientText("Swipe Left To Accept Request",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 16),colors:  [
                                  Color(0xff00ff56),
                                  Color(0xff00ff56),
                                  Color(0xff00ff56),
                                  Color(0xff00ff56),
                                ],),
                                SizedBox(width: 12,)
                              ],

                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(width: 12,),
                                GradientText("Swipe Right To Reject Request",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 16),colors:  [
                                  Color(0xffFE0944),
                                  Color(0xffFE0944),
                                  Color(0xffFE0944),
                                  Color(0xffFE0944),
                                ],),
                                Icon(Ionicons.arrow_forward_outline,color: Color(0xffFE0944),)
                              ],
                            ),
                            SizedBox(height: 8,),
                          ],

                        ),
                      )
                    ],
                  )
                ),
              ),
            ),
          );
        },
      )
    );
  }
}
