import 'dart:async';
import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../SharedPreferences/sharedPref.dart';
import '../models/ApplyOpModel.dart';
import '../models/DetailsModel.dart';
class ApiProvider{
  final Dio dio = Dio();
  final String _url = 'http://192.168.54.91:4000/';
  Future<DetailsModel>fetchStudentDetails() async {
    try {
      var ad=await tokener();
      if(ad==null){ad="";};
      // print("Habibi${ad}");
      String finalurl=_url+"pull";
      Response response = await dio.post(finalurl,data: {"ad":ad});
      //response pokunnunond
      //print(response.data);
      return DetailsModel.fromJson(response.data);
    } on Exception catch (error,stacktrace) {
      if(kDebugMode){
        print("Exception Occured: $error stacktrace $stacktrace");
      }
      return DetailsModel.withError("response.body as Map<String, dynamic>");
    }
  }
  Future<ApplyOpModel>ApplyOpDetails(ad,Destination,Purpose,DateofLeaving,DateofReturn) async {
    try {
      String finalurl=_url+"fillop";
      Response response = await dio.post(finalurl,data: {
        "ad":ad,
        "Destination":Destination,
        "purpose":Purpose,
        "Dateofleaving":DateofLeaving,
        "Dateofreturn":DateofReturn

      });
      return ApplyOpModel.fromJson(response.data);
    } on Exception catch (error,stacktrace) {
      if(kDebugMode){
        print("Exception Occured: $error stacktrace $stacktrace");
      }
      return ApplyOpModel.withError("response.body as Map<String, dynamic>");
    }
  }
}
