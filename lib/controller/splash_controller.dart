import 'dart:async';
import 'package:barbershop/service/check_connectivity.dart';
import 'package:barbershop/view/home_view.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  var code = 0.obs;
  var tryAgain = false.obs;
  var loading = true.obs;
  @override
  void onInit() {
    getStatusCode();
    super.onInit();
  }

  void getStatusCode() async {
    try {
      Future.delayed(Duration(seconds: 8), () {
        if (code.value == 0) {
          loading.value = false;
          tryAgain.value = true;
        }
      });
      var statusCode = await CheckConnectivity.checkNet();
      code.value = statusCode;
      if (code.value == 200)
        Timer(Duration(milliseconds: 2000), () => Get.to(() => HomeView()));
      else {
        loading.value = false;
        tryAgain.value = true;
        print(code.value);
      }
    } finally {}
  }
}
