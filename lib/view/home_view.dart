import 'package:barbershop/controller/home_tab_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:barbershop/components/carouselImageComponent.dart';
import 'package:barbershop/controller/movieListController.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final MovieListController movieListController =
        Get.put(MovieListController());

    final HomeTabController homeTabController = Get.put(HomeTabController());
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    Color primaryColor = Theme.of(context).primaryColor;
    Color primaryColorDark = Theme.of(context).primaryColorDark;
    Color primaryColorLight = Theme.of(context).primaryColorLight;
    Color cardColor = Theme.of(context).cardColor;
    return Scaffold(
      backgroundColor: primaryColorDark,
      body: new Stack(
        children: [
          Visibility(child: 
          Container(
            width: width,
            height: height,
            child: Center(
              child: ,
            ),
          ),)
        ],
      ));
  }
}
