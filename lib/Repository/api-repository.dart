import '../models/DetailsModel.dart';
import 'api-provider.dart';

class ApiRepository{
  final _provider = ApiProvider();

  Future<DetailsModel> fetchStudentDetails(){
    return _provider.fetchStudentDetails();
  }
}

class NetworkError extends Error{}
