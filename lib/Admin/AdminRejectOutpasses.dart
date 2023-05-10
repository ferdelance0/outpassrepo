import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart' show Ionicons;
import 'AdminHeaderDrawer.dart';
class RejectedPass extends StatefulWidget {
  const RejectedPass({Key? key}) : super(key: key);

  @override
  State<RejectedPass> createState() => _RejectedPassState();
}
List<String> _cardDataList = [
  "Don C Delish",
  "ELias T Kurian",
  "Neha Elsa Thomas",
  "Midhun Krishna",

];

class _RejectedPassState extends State<RejectedPass> {
  @override
  Widget build(BuildContext context) {
    var change = new GreetingChanger.changer("Rejected Passes");
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
          resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xffADE8F4),
        appBar:AdminAppbar(),
        drawer: AdminDrawer(),
          body: ListView.builder(
            itemCount: _cardDataList.length,
            itemBuilder: (context, index) {
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: Dismissible(
                    direction: DismissDirection.endToStart,
                    key: UniqueKey(), //change it for demo purposes
                    onDismissed: (direction) => {
                      {
                        if (direction == DismissDirection.endToStart)
                          {
                            print('Swiped left $index')
                          }
                      }
                    },
                    background: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(21),
                          color: Color(0xffFE0944),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: Text(
                                    "Reject request",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                    secondaryBackground: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(21),
                            color: Color(0xff00ff56)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: Text(
                                    "Accept request",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),

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
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.end,
                                    children: [
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
