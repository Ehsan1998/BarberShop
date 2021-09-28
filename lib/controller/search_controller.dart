import 'dart:async';

import 'package:barbershop/model/barbers.dart';
import 'package:barbershop/service/check_connectivity.dart';
import 'package:barbershop/view/homePage.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  var searchBarber = Barbers().obs;
  var visible = true.obs;
  var listVisible = false.obs;

  void fetchBarberSearchList(String search) async {
    try {
      var barberData = await CheckConnectivity.fetchBarberSearch(search);

      if (barberData != null) {
        searchBarber.value = barberData;
        print(searchBarber);
        print(searchBarber.value.data.length);
        Timer(Duration(milliseconds: 2000), () => Get.to(() => HomePage()));
        visible.value = false;
        listVisible.value = true;
      }
    } finally {}
  }
}
