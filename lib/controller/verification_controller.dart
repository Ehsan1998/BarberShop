import 'package:barbershop/model/accessToken.dart';
import 'package:barbershop/service/check_connectivity.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class VerificationController extends GetxController {
  var accessTokenModel = AccessToken().obs;

  void getAccess() async {
    try {
      var accessToken = await CheckConnectivity.getAccesstoken();
      if (accessToken != null) accessTokenModel.value = accessToken;

      GetStorage().write('accessToken', accessTokenModel.value.accessToken);
      print(GetStorage().read('accessToken'));
    } finally {}
  }
}
