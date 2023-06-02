import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginBloc extends Bloc <LoginEvents, LoginStates> {
  LoginBloc() : super(LoginInitial()) {

    on<VerifyPassword>(verifyPassword);
  }


  Future<String?> getMyToken() async {
    // Get the shared preferences instance
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Get the token
    String? token = prefs.getString('token');
    return token;
  }
  Future<FutureOr<void>> verifyPassword(
      VerifyPassword event,
      Emitter<LoginStates> emit) async {
      emit(Loading());

      try {
        var regBody = {
          "ad":event.username,
          "password":event.password,
        };

            var response = await http.post(Uri.parse("https://outpassbackend.onrender.com/login"),
          headers:{"Content-Type":"application/json"},
          body: jsonEncode(regBody)
            );

            var jsonResponse  = jsonDecode(response.body);
            if(jsonResponse['status']){
        var myToken = jsonResponse['token'];
        //this is the code to decode the token to obj
        Map<String,dynamic> jwtDecodedToken = JwtDecoder.decode(myToken);
        var role = jwtDecodedToken['role'];

        if(role=="user"){
          emit(LoginSuccessUser());
        }
        if(role=="admin"){
          emit(LoginSuccessAdmin());
        }
        if(role=="security"){
          emit(LoginSuccessSec());
        }
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', myToken);
            }
            else{
        emit(LoginError());
            }
      } on Exception catch (e) {
        print(e);
         emit(LoginError());
      }
  }
}

class LoginSuccessSec extends LoginStates{

}

class LoginSuccessAdmin extends LoginStates{
}

class LoginSuccessUser extends LoginStates{}

class LoginError extends LoginStates{
}
class LoginEvents {
}

class LoginStates {
}

class LoginInitial extends LoginStates{
}

class Loading extends LoginStates {}

class VerifyPassword extends LoginEvents {
  final String? username, password;
  VerifyPassword({this.username,this.password});
}