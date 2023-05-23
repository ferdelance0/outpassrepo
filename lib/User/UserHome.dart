import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mini/User/userapplypass.dart';
import 'package:mini/Bloc/LoginBloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Bloc/DetailsBloc.dart';
import '../LoginPage.dart';
import '../models/DetailsModel.dart';
import 'UserPassHIstory.dart';

class UserHome extends StatefulWidget {
  const UserHome({Key? key}) : super(key: key);

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  var token;
  String? name = "";
  int? ad;
  String? sem="";
  final DetailsBloc _detailsBloc = DetailsBloc();
  late Map<String?, dynamic> decodedToken = {};
  bool isLoading = true;

  Future<void> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    if (token != null) {
      decodedToken = await JwtDecoder.decode(token);
      // print(decodedToken["ad"]);
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getToken();
    _detailsBloc.add(GetDetails());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => _detailsBloc,
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
                    Builder(
                      builder: (context) {
                        return Text(
                          "Hello ${name ?? "" }",
                          style: TextStyle(color: Colors.black),
                        );
                      },
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Home",
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
                ),
              ),
              SizedBox(
                width: 15,
              )
            ],
          ),
          body: BlocListener<DetailsBloc, DetailsStates>(
              listener: (context, state) {
                if (state is DetailsLoaded) {
                  setState(() {
                    name = state.details.data2?[0].name;
                    ad=(state.details.data2?[0].ad);
                    print(ad);
                  });
                  // print(name);
                  // print(ad);
                } else if (state is DetailsError) {
                  state.error;
                } else {
                  // print("sff");
                }
              },
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ApplyOutpass(ad: ad,name: name,)),
                            );
                          },
                          child: Container(
                            width: 220,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Color(0xff215DA2),
                              borderRadius: BorderRadius.circular(56),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.add_box, color: Colors.white),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Apply For new Outpass",
                                  style: TextStyle(
                                      fontSize: 12.57, color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 17,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserHistory()),
                            );
                          },
                          child: Container(
                            width: 220,
                            height: 45,
                            decoration: BoxDecoration(
                              color: Color(0xff215DA2),
                              borderRadius: BorderRadius.circular(56),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 22,
                                ),
                                Icon(Icons.document_scanner_outlined,
                                    color: Colors.white),
                                SizedBox(
                                  width: 21,
                                ),
                                Text("Outpass History",
                                    style: TextStyle(
                                        fontSize: 13.57, color: Colors.white))
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 36,
                        ),
                      ],
                    ),
                  ],
                ),
              )),
        ));
  }
}
