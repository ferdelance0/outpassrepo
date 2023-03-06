import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class usermain extends StatelessWidget {
  const usermain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
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
              SizedBox(height: 17,),
              InkWell(
                onTap: (){},
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
    );
  }
}
