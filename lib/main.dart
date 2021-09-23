import 'package:barbershop/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFFf0b90b),
        primaryColorDark: Color(0xFF0B0E11),
        primaryColorLight: Colors.white,
      ),
      home: SplashView(),
    );
  }
}
