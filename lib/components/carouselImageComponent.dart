import 'package:barbershop/controller/home_tab_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class NewComponent {
  HomeTabController homeTabController = Get.put(HomeTabController());
  List<Widget> imageItem() {
    return homeTabController.imgUrl
        .map((element) => GestureDetector(
              onTap: () {
              },
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
