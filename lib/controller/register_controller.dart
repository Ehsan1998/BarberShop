import 'dart:async';

import 'package:barbershop/service/check_connectivity.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RegisterController extends GetxController {
  var phoneNumber = 'phone'.obs;
  var phoneCode = 0.obs;

  void sendPhone(String phone) async {
    try {
      GetStorage().write('phone', phone);
      print(phone);
      var statusCode = await CheckConnectivity.getCode(phone);
      phoneCode.value = statusCode;
    } finally {}
  }
}
