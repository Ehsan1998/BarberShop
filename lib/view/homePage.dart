import 'dart:io';

import 'package:barbershop/controller/home_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:barbershop/components/carouselImageComponent.dart';
import 'package:barbershop/controller/movieListController.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController controller = Get.put(HomeController());

  DateTime timeBackPressed = DateTime.now();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    Color primaryColor = Theme.of(context).primaryColor;
    Color primaryColorDark = Theme.of(context).primaryColorDark;
    Color primaryColorLight = Theme.of(context).primaryColorLight;
    Color cardColor = Theme.of(context).cardColor;
    return WillPopScope(
      onWillPop: () async {
        final difference = DateTime.now().difference(timeBackPressed);
        final isExitWarning = difference >= Duration(seconds: 2);
        timeBackPressed = DateTime.now();

        if (isExitWarning) {
          final message = 'برای خروج دوباره کلیک کنید';
          Fluttertoast.showToast(msg: message, fontSize: 18);
          return false;
        } else {
          Fluttertoast.cancel();
          exit(0);
          return true;
        }
      },
      child: Scaffold(
        body: Obx(
          () => Center(
            child: controller.tabs.elementAt(controller.selectedIndex.value),
          ),
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: cardColor,
            selectedItemColor: primaryColor,
            unselectedItemColor: Color(0xffADB4BD),
            selectedLabelStyle: TextStyle(
              fontFamily: 'sans',
              fontSize: height * 0.015,
            ),
            unselectedLabelStyle: TextStyle(
              fontFamily: 'sans',
              fontSize: height * 0.014,
            ),
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'پروفایل',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.map),
                label: 'نقشه',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'جستجو',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: 'خانه',
              ),
            ],
            currentIndex: controller.selectedIndex.value,
            onTap: (index) => controller.selectedIndex.value = index,
          ),
        ),
      ),
    );
  }
}
