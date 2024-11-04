import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobiletesting/login_screen/login_screen.dart';
import 'package:mobiletesting/login_screen/login_view_model.dart';
import 'package:mobiletesting/login_screen/sort_order.dart';
import 'package:mobiletesting/login_screen/login_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mock app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (_) => LoginViewModel(LoginService(),
            Random().nextBool() ? SortOrder.ascending : SortOrder.descending),
        child: LoginScreen(),
      ),
    );
  }
}
