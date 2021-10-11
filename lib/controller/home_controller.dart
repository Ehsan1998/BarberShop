import 'package:barbershop/view/map_view.dart';
import 'package:barbershop/view/home_view.dart';
import 'package:barbershop/view/profile_view.dart';
import 'package:barbershop/view/search_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectedIndex = 2.obs;

  final List<Widget> tabs = [
    ProfileView(),
    MapView(),
    SearchView(),
    HomeView(),
  ];
}
