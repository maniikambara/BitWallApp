// ignore_for_file: use_super_parameters, non_constant_identifier_names, unused_import
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/login_pages.dart';
import 'package:flutter_application_1/Pages/more_pages.dart';
import 'package:flutter_application_1/Pages/register_pages.dart';
import 'package:flutter_application_1/Pages/home_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/register': (context) => RegisterPages(),
        '/login': (context) => LoginPages(),
        '/home': (context) => HomePages(),
        '/more': (context) => MorePages(),
      },
    );
  }
}
