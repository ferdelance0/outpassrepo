import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AdminAddStudentsFailure.dart';
import 'AdminHeaderDrawer.dart';
import 'AdminHome.dart';
import 'AdminNewStudentSuccess.dart';

class AdminAddStudents extends StatefulWidget {
  const AdminAddStudents({Key? key}) : super(key: key);

  @override
  State<AdminAddStudents> createState() => _AdminAddStudentsState();
}
var name = TextEditingController();
class _AdminAddStudentsState extends State<AdminAddStudents> {
  @override
  Widget build(BuildContext context) {
    var change = new GreetingChanger.changer("Add Students");
    return  Scaffold(
        resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffADE8F4),
      appBar: AdminAppbar(),
      drawer: AdminDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            SizedBox(height: 30,),
            Container(
              height: 400,
              decoration: BoxDecoration(color: Color(0xff135097),borderRadius: BorderRadius.circular(21.59)),
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 25,),
                      Text("Add New Students",style: TextStyle(color: Colors.white,fontSize: 20),),
                      SizedBox(height: 15,),
                      SizedBox(
                         width:  MediaQuery.of(context).size.width * .8555,
                        child: TextField(
                          controller: name,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(15),
                              filled: true,
                              fillColor: Color(0xffB4E3EC),
                              prefixIconColor: Colors.black,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(14,))
                              ),
                              hintText: 'Name',
                          ),),
                      ),
                      SizedBox(height: 15,),
                      SizedBox(
                        width:  MediaQuery.of(context).size.width * .8555,
                        child: TextField(

                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(15),
                              filled: true,
                              fillColor: Color(0xffB4E3EC),
                              prefixIconColor: Colors.black,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(14))
                              ),
                              hintText: 'Admission Number',
                          ),),
                      ),
                      SizedBox(height: 15,),
                      SizedBox(
                        width:  MediaQuery.of(context).size.width * .8555,
                        child: TextField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(15),
                              filled: true,
                              fillColor: Color(0xffB4E3EC),
                              prefixIconColor: Colors.black,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(14,))
                              ),
                              hintText: 'Contact No',
                          ),),
                      ),
                      SizedBox(height: 15,),
                      SizedBox(
                        width:  MediaQuery.of(context).size.width * .8555,
                        child: TextField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(15),
                              filled: true,
                              fillColor: Color(0xffB4E3EC),
                              prefixIconColor: Colors.black,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(14,))
                              ),
                              hintText: 'Password',
                          ),),
                      ),
                      SizedBox(height: 12,),
                      MaterialButton(
                        height: 30.12 ,
                        minWidth: 106.62,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(29.0),
                        ),
                        elevation: 0,
                        color: Color(0xff03045E),
                        onPressed: () {
                          var naem1=name.text;
                          if(naem1=="manoj"){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AdminSuccess()),

                            );
                          }
                          else{
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AdminFailure()),

                            );
                          }

                        },
                        child: Text('Submit',style: TextStyle(color: Colors.white,fontSize: 15.58,fontWeight: FontWeight.w100),),
                      ),


                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
