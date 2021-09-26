import 'package:barbershop/view/homePage.dart';
import 'package:barbershop/view/register_view.dart';
import 'package:barbershop/view/verification_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
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
        cardColor: Color(0xFF1F2630),
      ),
      home: HomePage(),
    );
  }
}
