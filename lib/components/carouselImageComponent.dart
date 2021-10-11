import 'package:barbershop/controller/home_tab_controller.dart';
import 'package:barbershop/controller/movieListController.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NewComponent {
  HomeTabController homeTabController = Get.put(HomeTabController());
  final MovieListController movieListController =
      Get.put(MovieListController());
  List<Widget> imageItem() {
    return movieListController.imgUrl
        .map((element) => GestureDetector(
              onTap: () {},
              child: ClipRRect(
                child: Image.network(
                  element,
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
            ))
        .toList();
  }
}
