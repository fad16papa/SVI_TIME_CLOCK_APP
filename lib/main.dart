import 'package:flutter/material.dart';
import 'package:svi_time_clock_app/screens/login_main_screen.dart';
import 'package:svi_time_clock_app/screens/login_password_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SVI Time Clock',
      theme: ThemeData(
        primaryColor: Colors.deepPurpleAccent[400],
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Expanded(
            child: LogInMainScreen(),
          ),
        ),
      ),
      routes: {
        LogInPasswordScreen.routeName: (ctx) => LogInPasswordScreen(),
      },
    );
  }
}
