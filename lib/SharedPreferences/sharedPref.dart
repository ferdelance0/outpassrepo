import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

tokener() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('token');
  var decodedToken = await JwtDecoder.decode(token!);
  return decodedToken["ad"];
}
// class GetTokener{
//   int? ad;
//   GetTokener()  {
//     tokener();
//   }
//   Future<void> tokener() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     var token = prefs.getString('token');
//     var decodedToken = await JwtDecoder.decode(token!);
//     ad=decodedToken["ad"];
//     print(decodedToken["ad"]);
//   }
// }