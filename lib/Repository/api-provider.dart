import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mini/models/OpAcceptModel.dart';
import '../SharedPreferences/sharedPref.dart';
import '../models/ApplyOpModel.dart';
import '../models/DeleteOpModel.dart';
import '../models/DetailsModel.dart';
import '../models/LatestOpModel.dart';
import '../models/OpDetailsModel.dart';
import '../models/OpRejectModel.dart';
class ApiProvider{
  final Dio dio = Dio();
  final String _url = "https://outpassbackend.onrender.com/";
  Future<DetailsModel>fetchStudentDetails() async {
    try {
      var ad=await tokener();
      if(ad==null){ad="";};
      String finalurl=_url+"pull";
      Response response = await dio.post(finalurl,data: {"ad":ad});
      return DetailsModel.fromJson(response.data);
    } on Exception catch (error,stacktrace) {
      if(kDebugMode){
        print("Exception Occured: $error stacktrace $stacktrace");
      }
      return DetailsModel.withError("response.body as Map<String, dynamic>");
    }
  }
  Future<DetailsModel>fetchStudentDetailsSec() async {
    try {
      var ad=await tokener();
      if(ad==null){ad="";};
      String finalurl=_url+"pull";
      Response response = await dio.post(finalurl,data: {"ad":ad});
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
        "Dateofreturn":DateofReturn,
        "opStatus" : "Pending"
      });
      return ApplyOpModel.fromJson(response.data);
    } on Exception catch (error,stacktrace) {
      if(kDebugMode){
        print("Exception Occured: $error stacktrace $stacktrace");
      }
      return ApplyOpModel.withError("response.body as Map<String, dynamic>");
    }
  }
  Future<OpDetailsModel>AllOpDetailsPull() async {
    try {
      var ad=await tokener();
      if(ad==null){ad="";};
      String finalurl=_url+"opddtls";
      Response response = await dio.post(finalurl,data: {"ad":ad});
      return OpDetailsModel.fromJson(response.data);
    } on Exception catch (error,stacktrace) {
      if(kDebugMode){
        print("Exception Occured: $error stacktrace $stacktrace");
      }
      return OpDetailsModel.withError("Error Occured");
    }
  }
  Future<LatestOpModel>LatestOpPull() async{
    try{
      var ad=await tokener();
      if(ad==null){ad="";};
      String finalurl=_url+"lop";
      Response response = await dio.post(finalurl,data: {"ad":ad});
      return LatestOpModel.fromJson(response.data);
    } on Exception catch (error,stacktrace) {
      if(kDebugMode){
        print("Exception Occured: $error stacktrace $stacktrace");
      }
      return LatestOpModel.withError("Error Occured");
    }
  }
  Future<DeleteOpModel>DeleteOP() async{
    try{
      var ad=await tokener();
      if(ad==null){ad="";};
      String finalurl=_url+"deleteop";
      Response response = await dio.delete(finalurl,data: {"ad":ad});
      return DeleteOpModel.fromJson(response.data);
    } on Exception catch (error,stacktrace) {
      if(kDebugMode){
        print("Exception Occured: $error stacktrace $stacktrace");
      }
      return DeleteOpModel.withError("Error Occured");
    }
}
  Future<OpAcceptModel>AcceptOp(int index, String name) async{
    try{
      var ad=await tokener();
      print(index);
      print("object");
      if(ad==null){ad="";};
      String finalurl=_url+"accpt";
      Response response = await dio.get(finalurl,data: {"ad":"12367","Name":name});
      return OpAcceptModel.fromJson(response.data);
    } on Exception catch (error,stacktrace) {
      if(kDebugMode){
        print("Exception Occured: $error stacktrace $stacktrace");
      }
      return OpAcceptModel.withError("Error Occured");
    }
  }
  Future<OpRejectModel>RejectOp(int index, String name) async{
    try{
      var ad=await tokener();
      if(ad==null){ad="";};
      String finalurl=_url+"accpt";
      Response response = await dio.get(finalurl,data: {"ad":"12367","Name":name});
      return OpRejectModel.fromJson(response.data);
    } on Exception catch (error,stacktrace) {
      if(kDebugMode){
        print("Exception Occured: $error stacktrace $stacktrace");
      }
      return OpRejectModel.withError("Error Occured");
    }
  }
}

