import 'package:flutter/material.dart';
import 'package:shopez/account_info.dart';
import 'package:shopez/login_page.dart';
import 'package:shopez/scanner_page.dart';
import 'package:shopez/signup_age.dart';
import 'package:shopez/splash_screen.dart';


import 'home_page.dart';



void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,

      home: LoginPage(),
    );
  }
}