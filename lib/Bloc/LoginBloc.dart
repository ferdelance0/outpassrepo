import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class LoginBloc extends Bloc <LoginEvents, LoginStates> {
  LoginBloc() : super(LoginInitial()) {
    on<VerifyPassword>(verifyPassword);
  }

  Future<FutureOr<void>> verifyPassword(
      VerifyPassword event,
      Emitter<LoginStates> emit) async {
      emit(Loading());

      var regBody = {
        "ad":event.username,
        "password":event.password,
      };

    var response = await http.post(Uri.parse("http://192.168.1.8:4000/login"),
        headers:{"Content-Type":"application/json"},
        body: jsonEncode(regBody)
    );

    var jsonResponse  = jsonDecode(response.body);
    if(jsonResponse['status']){
      var myToken = jsonResponse['token'];
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
    }
    else{
      emit(LoginError());
    }

  }
}

class LoginSuccessSec extends LoginStates{
}

class LoginSuccessAdmin extends LoginStates{
}

class LoginSuccessUser extends LoginStates{
}

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