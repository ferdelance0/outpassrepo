import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'AdminAddStudents.dart';

class AdminFailure extends StatefulWidget {
  const AdminFailure({Key? key}) : super(key: key);

  @override
  State<AdminFailure> createState() => _AdminFailureState();
}

class _AdminFailureState extends State<AdminFailure> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffADE8F4),
      body: InkWell(
        onTap: (){Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AdminAddStudents()),

        );},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 250,
                child: Center(
                  child: Lottie.network("https://assets6.lottiefiles.com/packages/lf20_A4X8JVF2S6.json",
                      animate: true,

                  ),
                ),
              ),
              Text("Some Error Occured",style: TextStyle(color: Colors.redAccent,fontSize: 15),),
            ],
          ),
        ),
      ),

    );
  }
}
