import 'dart:async';

import 'package:barbershop/model/barbers.dart';
import 'package:barbershop/service/check_connectivity.dart';
import 'package:barbershop/view/homePage.dart';
import 'package:get/get.dart';

class HomeTabController extends GetxController {
  var barbers = Barbers().obs;
  var barbersOffer = Barbers().obs;
  var barbersSuggest = Barbers().obs;

  @override
  void onInit() {
    fetchBarberList();
    fetchBarberSuggestList();
    fetchBarberOfferList();
    super.onInit();
  }

  void fetchBarberList() async {
    try {
      var barberData = await CheckConnectivity.fetchBarber();

      if (barberData != null) {
        barbers.value = barberData;
        print(barbers);
        print(barbers.value.data.length);
        Timer(Duration(milliseconds: 2000), () => Get.to(() => HomePage()));
      }
    } finally {}
  }

  void fetchBarberSuggestList() async {
    try {
      var barberData = await CheckConnectivity.fetchBarberSuggest();

      if (barberData != null) {
        barbersSuggest.value = barberData;
        print(barbersSuggest);
        print(barbersSuggest.value.data.length);
        Timer(Duration(milliseconds: 2000), () => Get.to(() => HomePage()));
      }
    } finally {}
  }

  void fetchBarberOfferList() async {
    try {
      var barberData = await CheckConnectivity.fetchBarberOffer();

      if (barberData != null) {
        barbersOffer.value = barberData;
        print(barbersOffer);
        print(barbersOffer.value.data.length);
        Timer(Duration(milliseconds: 2000), () => Get.to(() => HomePage()));
      }
    } finally {}
  }
}
