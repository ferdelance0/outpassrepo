import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'AdminAddStudents.dart';

class AdminSuccess extends StatefulWidget {
  const AdminSuccess({Key? key}) : super(key: key);

  @override
  State<AdminSuccess> createState() => _AdminSuccessState();
}

class _AdminSuccessState extends State<AdminSuccess> {
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
                height: 350,
                child: Center(
                  child: Lottie.network("https://assets7.lottiefiles.com/packages/lf20_ex1izvjy.json",
                      animate: true,
                    repeat: false
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
