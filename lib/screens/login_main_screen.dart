import 'dart:math';

import 'package:flutter/material.dart';

class LogInMainScreen extends StatefulWidget {
  static const routeName = '/loing-main';

  @override
  _LogInMainScreenState createState() => _LogInMainScreenState();
}

class _LogInMainScreenState extends State<LogInMainScreen> {
  final _form = GlobalKey<FormState>();
  final _userName = FocusNode();

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('SVI Time Clock'),
      ),
      body: Container(
        height: deviceSize.height,
        width: deviceSize.width,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
            key: _form,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(hintText: 'UserName'),
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_userName);
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please provide your User Name';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
