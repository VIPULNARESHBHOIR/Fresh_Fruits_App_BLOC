import 'package:flutter/material.dart';
import 'package:grocery/features/home/ui/home.dart';

// import 'features/Trial/listview.dart';
import 'features/MyProducts/ui/productsView.dart';
import 'features/login/login.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF316300),
      ),
      home: LoginScreen(),
    );
  }
}
