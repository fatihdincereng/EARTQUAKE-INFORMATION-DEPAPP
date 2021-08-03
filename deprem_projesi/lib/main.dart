import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'splash_screen.dart';

void main() {
  runApp(DepremApp());
}

class DepremApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff80B34F),
      ),
      home: SplashPage(),
    );
  }
}
