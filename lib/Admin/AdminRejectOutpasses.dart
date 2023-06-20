import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart' show Ionicons;
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../Bloc/AdminHomeDataBloc.dart';
import '../Bloc/RejectedOpBloc.dart';
import 'AdminHeaderDrawer.dart';
import 'package:intl/intl.dart';
class RejectedPass extends StatefulWidget {
  RejectedPass({Key? key}) : super(key: key);

  @override
  State<RejectedPass> createState() => _RejectedPassState();
}

class _RejectedPassState extends State<RejectedPass> {
  @override

  RejectedOpBloc _RejectedOpBloc = new RejectedOpBloc();
  void initState() {
    _RejectedOpBloc = BlocProvider.of<RejectedOpBloc>(context);
    _RejectedOpBloc.add(GetRejectedOp());
  }

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
          appBar: AdminAppbar(),
          drawer: AdminDrawer(),
          body: BlocProvider<RejectedOpBloc>(
              create: (_) => _RejectedOpBloc,
              child: BlocBuilder<RejectedOpBloc, RejectedOpStates>(
                  builder: (context, state) {
                    if(state is RejectedOpLoading){
                      return Center(
                          child: LoadingAnimationWidget.flickr(
                              leftDotColor: Colors.white,
                              rightDotColor: Colors.indigo,
                              size: 30));
                    }
                else if (state is RejectedOpLoaded) {
                  return ListView.builder(
                    itemCount: state.RejectedOp.data?.length,
                    itemBuilder: (context, index) {
                      return SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                          child: Dismissible(
                            key: UniqueKey(), //change it for demo purposes
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
                                      padding: const EdgeInsets.fromLTRB(
                                          13, 10, 11, 0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                     " ${state.RejectedOp.data?[index].user}",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w900,
                                                fontSize: 17),
                                          ),
                                          SizedBox(
                                            width: 24,
                                          ),
                                          Text("# ${state.RejectedOp.data?[index].ad}",
                                              style: TextStyle(
                                                  color: Colors.white)),
                                          SizedBox(
                                            width: 9,
                                          ),
                                          Text("#${state.RejectedOp.data?[index].semester}",
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          13, 5, 11, 0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${state.RejectedOp.data?[index].purpose}",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Center(
                                              child: SizedBox(
                                            width: 10,
                                          )),
                                          Center(
                                              child: Text("at",
                                                  style: TextStyle(
                                                      color:
                                                          Color(0xff63BBDA)))),
                                          Center(
                                              child: SizedBox(
                                            width: 15,
                                          )),
                                          Text(
                                            "${state.RejectedOp.data?[index].destination}",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          13, 4, 11, 0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Leaves on :",
                                            style: TextStyle(
                                                color: Color(0xff63BBDA),
                                                fontSize: 15),
                                          ),
                                          SizedBox(
                                            width: 3,
                                          ),
                                          Text(
                                              DateConversion("${state.RejectedOp.data?[index].dateofleaving}"),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 17,
                                                fontWeight: FontWeight.w900),
                                          ),
                                          SizedBox(
                                            width: 3,
                                          ),
                                          Text(
                                            "at:",
                                            style: TextStyle(
                                                color: Color(0xff63BBDA),
                                                fontSize: 15),
                                          ),
                                          SizedBox(
                                            width: 3,
                                          ),
                                          Text(
                                              TimeConversion("${state.RejectedOp.data?[index].dateofleaving}"),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 17,
                                                fontWeight: FontWeight.w900),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          13, 2, 11, 0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Arrives on :",
                                            style: TextStyle(
                                                color: Color(0xff63BBDA),
                                                fontSize: 15),
                                          ),
                                          SizedBox(
                                            width: 3,
                                          ),
                                          Text(
                                            DateConversion("${state.RejectedOp.data?[index].dateofreturn}"),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 17,
                                                fontWeight: FontWeight.w900),
                                          ),
                                          SizedBox(
                                            width: 3,
                                          ),
                                          Text(
                                            "at:",
                                            style: TextStyle(
                                                color: Color(0xff63BBDA),
                                                fontSize: 15),
                                          ),
                                          SizedBox(
                                            width: 7,
                                          ),
                                          Text(
                                            TimeConversion("${state.RejectedOp.data?[index].dateofreturn}"),
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
                  );
                } else {
                  return Text("No Outpasses");
                }
              }))),
    );
  }
}
String DateConversion(String? a) {
  DateTime dateTime = DateTime.parse(a!);
  String formattedDate = DateFormat('dd-MM-yyyy').format(dateTime);
  return formattedDate;
}
String TimeConversion(String? a) {
  DateTime dateTime = DateTime.parse(a!);
  String formattedTime = DateFormat('hh:mm a').format(dateTime);
  return formattedTime;
}