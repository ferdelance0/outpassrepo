import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../models/DetailsModel.dart';
class ApiProvider{
  final Dio dio = Dio();
  final String _url = 'http://192.168.1.9:4000/';
  Future<DetailsModel>fetchStudentDetails() async {
    try {
      String finalurl=_url+"pull";
      Response response = await dio.post("http://192.168.1.9:4000/pull",data: {"ad":"12367"});
      print(response.data);
      print(DetailsModel.fromJson(response.data).status);
      return DetailsModel.fromJson(response.data);
    } on Exception catch (error,stacktrace) {
      if(kDebugMode){
        print("Exception Occured: $error stacktrace $stacktrace");
      }
      return DetailsModel.withError("response.body as Map<String, dynamic>");
    }
  }
}
