import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../SharedPreferences/sharedPref.dart';
import '../models/DetailsModel.dart';
class ApiProvider{
  final Dio dio = Dio();
  final String _url = 'http://192.168.1.9:4000/';
  Future<DetailsModel>fetchStudentDetails() async {
    try {
      var ad=await tokener();
      if(ad==null){ad="";};
      print("Habibi${ad}");
      String finalurl=_url+"pull";
      Response response = await dio.post("http://192.168.1.9:4000/pull",data: {"ad":ad});
      return DetailsModel.fromJson(response.data);
    } on Exception catch (error,stacktrace) {
      if(kDebugMode){
        print("Exception Occured: $error stacktrace $stacktrace");
      }
      return DetailsModel.withError("response.body as Map<String, dynamic>");
    }
  }
}
