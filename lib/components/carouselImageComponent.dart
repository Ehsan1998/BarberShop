import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:barbershop/controller/movieListController.dart';


class NewComponent {
  MovieListController movieListController1 = Get.put(MovieListController());
  List<Widget> imageItem() {
    return movieListController1.imgUrl
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
