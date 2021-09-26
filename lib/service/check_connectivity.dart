import 'dart:convert';

import 'package:barbershop/controller/register_controller.dart';
import 'package:barbershop/model/accessToken.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:barbershop/model/movieList.dart';


class CheckConnectivity {
  
  static var client = http.Client();

  static Future checkNet() async {
    final String url = 'https://jsonplaceholder.typicode.com/todos/1';
    print('fuck ur cooode');
    var response = await http.get(Uri.parse(url));
    print('fuck ur code ${response.statusCode}');
    return response.statusCode;
  }

  static Future getCode(String phone) async {
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Cookie':
          'krarhay_arayshgahy_session=zyTBtpGsLaGllwpU5JmZA3aBgpbs3WSqNdONbddD'
    };
    var request = http.Request(
        'POST', Uri.parse('https://www.ehsankatebi.ir/api/sendOneTimeCode'));
    print(phone);
    request.body = json.encode({"phone": '0$phone'});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
    // final String url = 'https://www.ehsankatebi.ir/api/sendOneTimeCode';
    // print('hello mother fucker');
    // var response = await http.post(Uri.parse(url), body: {
    //   "phone": phone
    // }, headers: {
    //   'Accept': 'application/json',
    // });
    print('ur fucking response code is ${response.statusCode}');
  }

  static Future getAccesstoken() async {
    final String url = 'https://www.ehsankatebi.ir/api/login';
    print('fuck ur cooode');
    var response = await http.post(Uri.parse(url), body: {"phone": GetStorage().read('phone'), "code": GetStorage().read('code')
    });
    print('fuck ur code ${response.statusCode}');
    if (response.statusCode == 200) {
      var jsonString = response.body;
      var data = accessTokenFromJson(jsonString);
      return data;
    } else 
      return null;
  }

  static Future<MovieList> fetchListData(String url) async {
    var response = await client.get(Uri.parse(url));
    print(response.statusCode);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      var data = movieListFromJson(jsonString);
      return data;
    } else {
      return null;
    }
  }
}
