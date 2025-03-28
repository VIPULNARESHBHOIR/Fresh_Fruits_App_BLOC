import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginButtonClickedEvent>(loginButtonClickedEvent);
  }

  FutureOr<void> loginButtonClickedEvent(
      LoginButtonClickedEvent event, Emitter<LoginState> emit) async{

    var client = http.Client();
    try{
      print('${event.username} : ${event.password}');

      var response  = await client.get(Uri.parse('https://api.github.com/users/${event.username}'));
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = jsonDecode(response.body);
        print(jsonData);

        //Map<String, dynamic> employeeData = jsonData['data'];
        // Extract employee details
        String UserName = jsonData['login']; //considered as username
        int UserPassword = jsonData['id']; //considered as password

        print('${UserName} => ${UserPassword}');

        if (UserPassword.toString().trim() == event.password.trim()) {
          print('SUCCESSFUL');
          emit(LoginSuccessful());

        } else {
          print('UNSUCCESSFUL');
          emit(LoginFailed());
        }


      }
      else{
        emit(LoginFailed());
      }

    }

    catch(e){
      print(e.toString());
    }

  }
}
