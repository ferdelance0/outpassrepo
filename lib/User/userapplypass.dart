import 'package:date_field/date_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

import '../Admin/AdminHome.dart';
import '../LoginPage.dart';
import 'UserOutPassDetailed.dart';
import 'UserTaskbar.dart';

class ApplyOutpass extends StatefulWidget {
  const ApplyOutpass({Key? key}) : super(key: key);

  @override
  State<ApplyOutpass> createState() => _ApplyOutpassState();
}

class _ApplyOutpassState extends State<ApplyOutpass> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffADE8F4),
      appBar:UserAppbar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          //nnj
          children: [
            Container(
              height: 460,
              width: 365,
              decoration: BoxDecoration(
                color: Color(0xff215DA2),
                borderRadius: BorderRadius.circular(17)
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [


                    Text("Destination",style: TextStyle(color: Colors.white),),
                    SizedBox(
                      height:70,
                      child: TextField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xffB4E3EC),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text("Purpose",style: TextStyle(color: Colors.white),),
                    SizedBox(
                      height:70,
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xffB4E3EC),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height:5,),


                    Text("Date and Time of Leaving",style: TextStyle(color: Colors.white),),
                    SizedBox(
                      height:70,
                      child: DateTimeFormField(
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(0xffB4E3EC),
                          hintStyle: TextStyle(color: Colors.white),
                          errorStyle: TextStyle(color: Colors.redAccent),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          suffixIcon: Icon(Icons.event_note),
                        ),
                        mode: DateTimeFieldPickerMode.dateAndTime,
                        autovalidateMode: AutovalidateMode.always,
                        validator: (e) => (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                        onDateSelected: (DateTime value) {
                          print(value);
                        },
                      ),
                    ),
                    Text("Date and Time of Leaving",style: TextStyle(color: Colors.white),),
                    SizedBox(
                      height:70,
                      child: DateTimeFormField(
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(0xffB4E3EC),
                          hintStyle: TextStyle(color: Colors.white),
                          errorStyle: TextStyle(color: Colors.redAccent),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          suffixIcon: Icon(Icons.event_note),
                        ),
                        mode: DateTimeFieldPickerMode.dateAndTime,
                        autovalidateMode: AutovalidateMode.always,
                        validator: (e) => (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                        onDateSelected: (DateTime value) {
                          print(value);
                        },
                      ),
                    ),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MaterialButton(onPressed: (){
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => UserOutPassDetailed()),

                          );
                        },child: Text("Submit",style: TextStyle(color: Colors.white),),
                          height: 43.12 ,
                          minWidth: 133.62,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(29.0),
                          ),
                          elevation: 0,
                          color: Color(0xff03045E),),
                      ],
                    )
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
