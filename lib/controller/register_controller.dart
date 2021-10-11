import 'dart:async';

import 'package:barbershop/service/check_connectivity.dart';
import 'package:barbershop/view/verification_view.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RegisterController extends GetxController {
  var phoneNumber = 'phone'.obs;
  var phoneCode = 0.obs;
  var textVisible = true.obs;
  var loadingVisible = false.obs;

  void sendPhone(String phone) async {
    try {
      GetStorage().write('phone', "0$phone");
      print(phone);
      var statusCode = await CheckConnectivity.getCode(phone);
      phoneCode.value = statusCode;
      print('ssssssstaaaaaaaaaaaaatuuuuuuuuuuuus$statusCode');
      if (statusCode == 200)
        Get.to(VerificationView());
      else {
        print('elseeeeeeeeeeeeeeeeeeeeeee');
        textVisible.value = true;
        loadingVisible.value = false;
      }
    } finally {}
  }
}
