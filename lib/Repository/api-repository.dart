import 'package:mini/Bloc/OpDetailsBloc.dart';
import 'package:mini/models/ApplyOpModel.dart';
import 'package:mini/models/LatestOpModel.dart';
import 'package:mini/models/OpDetailsModel.dart';

import '../models/DetailsModel.dart';
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
}

class NetworkError extends Error{}
