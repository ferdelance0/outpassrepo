import 'package:mini/models/ApplyOpModel.dart';

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
}

class NetworkError extends Error{}
