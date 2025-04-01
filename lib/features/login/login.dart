import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/features/MyProducts/ui/productsView.dart';
import 'package:grocery/features/login/bloc/login_bloc.dart';
import 'package:grocery/features/login/shopping_type_selection.dart';

import '../home/ui/home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final LoginBloc loginBloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color.fromARGB(255, 135, 243, 33), Color.fromARGB(255, 0, 110, 221)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: BlocConsumer<LoginBloc, LoginState>(
            bloc: loginBloc,
            listenWhen: (previous, current) => current is LoginActionState,
            buildWhen: (previous, current) => current is! LoginActionState,

            listener: (context, state) {
              if (state is LoginSuccessful) {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> ShoppingType(username: usernameController.text,)));
              } else if (state is LoginFailed){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Color.fromARGB(255, 0, 54, 23),
                  content: Center(
                  child: Row(
                    children: [
                      Icon(Icons.close, color: Colors.red, size: 50,),
                      SizedBox(width: 10,),
                      Text(
                        'Login Failed! please check username AND password',
                      ),
                    ],
                  ),
                ),
                ));
              }
            },
            builder: (context, state) {
              return Center(
                  child: Container(
                      width: 300,
                      child: SingleChildScrollView(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: Color.fromARGB(255, 135, 243, 33),
                                child: Icon(Icons.person, color: Colors.white),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextField(
                                controller: usernameController,
                                style: TextStyle(color: Colors.white,
                                    fontSize: 20),
                                cursorColor: Colors.white,
                                decoration: InputDecoration(
                                  floatingLabelStyle: TextStyle(
                                      color: Color.fromARGB(255, 135, 243, 33)),
                                  labelText: 'Username',
                                  labelStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                  ),
                                  floatingLabelBehavior: FloatingLabelBehavior.never,
                                  focusedBorder: OutlineInputBorder(
                        
                                    // Border when focused
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(255, 135, 243, 33),
                                        width: 2),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    // Border when not focused
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(255, 135, 243, 33),
                                        width: 1),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextField(
                                controller: passwordController,
                        
                                cursorColor: Colors.white,
                                style: TextStyle(color: Colors.white,
                                fontSize: 20),
                                decoration: InputDecoration(
                                  floatingLabelBehavior: FloatingLabelBehavior.never,
                                  floatingLabelStyle: TextStyle(
                                      color: Color.fromARGB(255, 135, 243, 33)),
                                  labelText: 'Password',
                                  labelStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                        
                                    // Border when focused
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(255, 135, 243, 33),
                                        width: 2),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    // Border when not focused
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(255, 135, 243, 33),
                                        width: 1),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                width: 150,
                                height: 50,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Color.fromARGB(255, 135, 243, 33),
                                      // Button background color
                                      foregroundColor: Colors.white,
                                      // Text color
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            8), // Rounded corners
                                      ),
                                    ),
                                    onPressed: () {
                                      loginBloc.add(LoginButtonClickedEvent(
                                          username: usernameController.text,
                                          password: passwordController.text));
                                    },
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 20,
                                      ),
                                    )),
                              )
                            ]),
                      )));
            },
          ),
        ));
  }
}
