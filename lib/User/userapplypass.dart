import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mini/Bloc/ApplyOpBloc.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

import '../Admin/AdminHome.dart';
import '../LoginPage.dart';
import 'UserOutPassDetailed.dart';
import 'UserTaskbar.dart';

class ApplyOutpass extends StatefulWidget {
  final String? name;
  final int? ad;

  ApplyOutpass({Key? key,required int? this.ad,required String? this.name}) : super(key: key);

  @override
  State<ApplyOutpass> createState() => _ApplyOutpassState();
}

class _ApplyOutpassState extends State<ApplyOutpass> {
  final ApplyOpBloc _applyOpBloc = ApplyOpBloc();
  final Destination = TextEditingController();
  final Purpose = TextEditingController();
   var DateAndTimeOfLeaving ;
   var DateAndTimeOfArrival ;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffADE8F4),
      appBar:UserAppbar(name: widget.name,pgtitle: "New Outpass",),
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
                        controller: Destination,
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

                        controller: Purpose,
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
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
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
                          var Date =value.toString();
                          DateAndTimeOfLeaving=Date;
                        },
                      ),
                    ),
                    Text("Date and Time of Arrival",style: TextStyle(color: Colors.white),),
                    SizedBox(
                      height:70,
                      child: DateTimeFormField(
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
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
                          var Date =value.toString();
                          DateAndTimeOfArrival=Date;
                        },
                      ),
                    ),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MaterialButton(onPressed: (){
                        BlocProvider.of<ApplyOpBloc>(context).add(
                        ApplyPush(
                          ad:widget.ad.toString(),
                          Destination: Destination.text,
                          Purpose: Purpose.text,
                          Dateofleaving: DateAndTimeOfLeaving,
                          Dateofreturn: DateAndTimeOfArrival
                        )
                        );

                        },child: BlocConsumer<ApplyOpBloc,ApplyOpStates>(
                          listener: (context,state){
                            if(state is ApplyOpSuccess){
                              CherryToast.success(
                                title: Text(''),
                                enableIconAnimation: false,
                                displayTitle: false,
                                description: Text("Outpass Application Submitted",style: TextStyle(fontSize: 12),),
                                toastPosition: Position.bottom,
                                animationDuration: Duration(milliseconds: 500),
                                toastDuration: Duration(milliseconds: 1500),
                                autoDismiss: true,
                              ).show(context);
                            }
                            if(state is ApplyOpLoading){

                            }
                            if(state is ApplyOpError){
                              CherryToast.error(
                                title: Text(''),
                                enableIconAnimation: false,
                                displayTitle: false,
                                description: Text(state.error!,style: TextStyle(fontSize: 12),),
                                toastPosition: Position.bottom,
                                animationDuration: Duration(milliseconds: 500),
                                toastDuration: Duration(milliseconds: 1500),
                                autoDismiss: true,
                              ).show(context);
                            }

                          },
                          builder: (context,state){
                            if(state is ApplyOpSuccess){

                            }
                            if(state is ApplyOpLoading){
                              return LoadingAnimationWidget.staggeredDotsWave(color: Colors.white, size: 30);
                            }
                            else{
                              return Text("Submit", style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w100));
                            }
                            return Text("GEee");
                          },
                        ),

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
