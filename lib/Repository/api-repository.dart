import 'package:mini/Bloc/OpDetailsBloc.dart';
import 'package:mini/models/AdmnPullModel.dart';
import 'package:mini/models/ApplyOpModel.dart';
import 'package:mini/models/LatestOpModel.dart';
import 'package:mini/models/OpAcceptModel.dart';
import 'package:mini/models/OpDetailsModel.dart';
import 'package:mini/models/SecVerifModel.dart';

import '../models/AdminHomeDataModel.dart';
import '../models/DeleteOpModel.dart';
import '../models/DetailsModel.dart';
import '../models/OpRejectModel.dart';
import '../models/RejectedOpModel.dart';
import '../models/SecLopModel.dart';
import 'api-provider.dart';

class ApiRepository{
  final _provider = ApiProvider();
  Future<DetailsModel> fetchStudentDetails(){
    return _provider.fetchStudentDetails();
  }
  Future<ApplyOpModel> ApplyOpDetails(ad,Destination,Purpose,DateofLeaving,DateofReturn){
    return _provider.ApplyOpDetails(ad,Destination,Purpose,DateofLeaving,DateofReturn);
  }
  Future<OpDetailsModel> AllOpDetailsPull(){
    return _provider.AllOpDetailsPull();
  }
  Future<LatestOpModel> LatestOpPull(){
    return _provider.LatestOpPull();
  }
  Future<DeleteOpModel> DeleteOP(){
    return _provider.DeleteOP();
  }
  Future<OpAcceptModel> AcceptOP(int index, String name){
    return _provider.AcceptOp(index,name);
  }
  Future<OpRejectModel> RejectOP(int index, String name){
    return _provider.RejectOp(index,name);
  }
  Future<AdmnPullModel> AdmnPull(){
    return _provider.AdmnPull();
  }
  Future<AdminHomeDataModel> AdmnHomeDataPull(){
    return _provider.AdmnHomeDataPull();
  }
  Future<RejectedOpModel> RejecteDataPull(){
    return _provider.RejecteDataPull();
  }
  Future<SecVerifModel> SecVerifPull(String scannedText){
    return _provider.SecVerifPull(scannedText);
  }
  Future<SecLopModel> SecLopPull(String scannedText){
    return _provider.SecLopPull(scannedText);
  }


}

class NetworkError extends Error{}
