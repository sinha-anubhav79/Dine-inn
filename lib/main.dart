import 'package:flutter/material.dart';
import 'package:dine_inn/loginPage.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new LoginPage(),
    );
  }
}
