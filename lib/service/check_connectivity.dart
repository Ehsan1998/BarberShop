import 'dart:convert';

import 'package:barbershop/controller/register_controller.dart';
import 'package:barbershop/model/accessToken.dart';
import 'package:barbershop/model/barbers.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:barbershop/model/movieList.dart';

class CheckConnectivity {
  static var client = http.Client();

  static Future checkNet() async {
    final String url = 'https://www.ehsankatebi.ir/api/barbers/index';
    print('fuck ur cooode');
    var response = await http.get(Uri.parse(url), headers: {
      'Accept': 'application/json',
      'Authorization': '${GetStorage().read('accessToken')}'
    });
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
    return response.statusCode;
  }

  static Future getAccesstoken() async {
    final String url = 'https://www.ehsankatebi.ir/api/login';
    print('fuck ur cooode');
    var response = await http.post(Uri.parse(url), body: {
      "phone": GetStorage().read('phone'),
      "code": GetStorage().read('code')
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

  static Future fetchBarber() async {
    var response = await client.get(
        Uri.parse('https://www.ehsankatebi.ir/api/barbers/index'),
        headers: {
          'Authorization':
              'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMTMzMzhmMzAyNjFiZDc3ZDBiYTE4M2UwYTgxMDA5OTliOGIyMDhiNjFhOGJmZmI2ZTllMTdjMjhlNTlmNjY1OWY1NDQxMmJkMDRkYTkwYjMiLCJpYXQiOjE2MzI3MzI5MDQuNDU3MDU3LCJuYmYiOjE2MzI3MzI5MDQuNDU3MDY3LCJleHAiOjE2NjQyNjg5MDQuNDQ3Mjk1LCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.bSPzxWIA-e-YGN-kZBxvAzowY8yz1IMmTbaApkFW-PGajp0KDNxXSM81c-IPSnjfib7Y3ajE8gbC7maFTgTW8SoqYDGcanSQzhg8JKUqo5ywthiHp_zFteUOcUkiiybOJsrYKim7mnmONOrZ95pzm7cCsJp8MOV60gx4scxYWNpT6yxQeOaqWs0mSUy2bYvFE1UsvFJLh3jgw-8HZGFo0VY8ojuz-JXyJzwKNu-visvHmSY9Bg9AxA5aj3rH84bPZIQ_HxSOQz4EbmoYLtpu1S07M0ew6untH9VJ9oRCy4aUTdTsacU5AH2zzeVLSV7DfeGSeVi-8CNw9HDNf-jblx0H1j9qGw5KGEGxb3Jw2UzC-FjkvojzgQChXtc-IGVvRFRamN1fasQIaCpt3_2UtXLr6CvsPTRZue1VGo-VAd1Xo4toPvLY_JC1ugFO7Ij-CcnzW7VY83J7yizAAsK4Lu8lB7bD9C57JYV6iYxodz6PvfIEazht0iGlpVy_XNEeyr2qGtD4QUZ1nxaX5nOaThc08S8QVEozDkOqToUXA7c06ORzNhdWD9pPcp1XcoALFwWhlZPy9pyFvgGPr8micdY958wyASviasme_RsIq3LQCUlAnKG2Q1BoTZuvnLwfNR1w-QWypW522Wd5-BsXY5HAfqM3tJsUc3v4yZvdR0I',
          'Accept': 'application/json',
        });
    print(
        'ttthhheeeee fuuuucccckkkkinggggg reeeessppoooonseeeee${response.statusCode}');
    if (response.statusCode == 200) {
      var jsonString = response.body;
      var data = barbersFromJson(jsonString);
      return data;
    } else {
      return null;
    }
  }

  static Future fetchBarberSuggest() async {
    var response = await client.get(
        Uri.parse('https://www.ehsankatebi.ir/api/barbers/suggest'),
        headers: {
          'Authorization':
              'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMTMzMzhmMzAyNjFiZDc3ZDBiYTE4M2UwYTgxMDA5OTliOGIyMDhiNjFhOGJmZmI2ZTllMTdjMjhlNTlmNjY1OWY1NDQxMmJkMDRkYTkwYjMiLCJpYXQiOjE2MzI3MzI5MDQuNDU3MDU3LCJuYmYiOjE2MzI3MzI5MDQuNDU3MDY3LCJleHAiOjE2NjQyNjg5MDQuNDQ3Mjk1LCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.bSPzxWIA-e-YGN-kZBxvAzowY8yz1IMmTbaApkFW-PGajp0KDNxXSM81c-IPSnjfib7Y3ajE8gbC7maFTgTW8SoqYDGcanSQzhg8JKUqo5ywthiHp_zFteUOcUkiiybOJsrYKim7mnmONOrZ95pzm7cCsJp8MOV60gx4scxYWNpT6yxQeOaqWs0mSUy2bYvFE1UsvFJLh3jgw-8HZGFo0VY8ojuz-JXyJzwKNu-visvHmSY9Bg9AxA5aj3rH84bPZIQ_HxSOQz4EbmoYLtpu1S07M0ew6untH9VJ9oRCy4aUTdTsacU5AH2zzeVLSV7DfeGSeVi-8CNw9HDNf-jblx0H1j9qGw5KGEGxb3Jw2UzC-FjkvojzgQChXtc-IGVvRFRamN1fasQIaCpt3_2UtXLr6CvsPTRZue1VGo-VAd1Xo4toPvLY_JC1ugFO7Ij-CcnzW7VY83J7yizAAsK4Lu8lB7bD9C57JYV6iYxodz6PvfIEazht0iGlpVy_XNEeyr2qGtD4QUZ1nxaX5nOaThc08S8QVEozDkOqToUXA7c06ORzNhdWD9pPcp1XcoALFwWhlZPy9pyFvgGPr8micdY958wyASviasme_RsIq3LQCUlAnKG2Q1BoTZuvnLwfNR1w-QWypW522Wd5-BsXY5HAfqM3tJsUc3v4yZvdR0I',
          'Accept': 'application/json',
        });
    print(
        'ttthhheeeee fuuuucccckkkkinggggg reeeessppoooonseeeee${response.statusCode}');
    if (response.statusCode == 200) {
      var jsonString = response.body;
      var data = barbersFromJson(jsonString);
      return data;
    } else {
      return null;
    }
  }

  static Future fetchBarberOffer() async {
    var response = await client.get(
        Uri.parse('https://www.ehsankatebi.ir/api/barbers/offer'),
        headers: {
          'Authorization':
              'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMTMzMzhmMzAyNjFiZDc3ZDBiYTE4M2UwYTgxMDA5OTliOGIyMDhiNjFhOGJmZmI2ZTllMTdjMjhlNTlmNjY1OWY1NDQxMmJkMDRkYTkwYjMiLCJpYXQiOjE2MzI3MzI5MDQuNDU3MDU3LCJuYmYiOjE2MzI3MzI5MDQuNDU3MDY3LCJleHAiOjE2NjQyNjg5MDQuNDQ3Mjk1LCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.bSPzxWIA-e-YGN-kZBxvAzowY8yz1IMmTbaApkFW-PGajp0KDNxXSM81c-IPSnjfib7Y3ajE8gbC7maFTgTW8SoqYDGcanSQzhg8JKUqo5ywthiHp_zFteUOcUkiiybOJsrYKim7mnmONOrZ95pzm7cCsJp8MOV60gx4scxYWNpT6yxQeOaqWs0mSUy2bYvFE1UsvFJLh3jgw-8HZGFo0VY8ojuz-JXyJzwKNu-visvHmSY9Bg9AxA5aj3rH84bPZIQ_HxSOQz4EbmoYLtpu1S07M0ew6untH9VJ9oRCy4aUTdTsacU5AH2zzeVLSV7DfeGSeVi-8CNw9HDNf-jblx0H1j9qGw5KGEGxb3Jw2UzC-FjkvojzgQChXtc-IGVvRFRamN1fasQIaCpt3_2UtXLr6CvsPTRZue1VGo-VAd1Xo4toPvLY_JC1ugFO7Ij-CcnzW7VY83J7yizAAsK4Lu8lB7bD9C57JYV6iYxodz6PvfIEazht0iGlpVy_XNEeyr2qGtD4QUZ1nxaX5nOaThc08S8QVEozDkOqToUXA7c06ORzNhdWD9pPcp1XcoALFwWhlZPy9pyFvgGPr8micdY958wyASviasme_RsIq3LQCUlAnKG2Q1BoTZuvnLwfNR1w-QWypW522Wd5-BsXY5HAfqM3tJsUc3v4yZvdR0I',
          'Accept': 'application/json',
        });
    print(
        'ttthhheeeee fuuuucccckkkkinggggg reeeessppoooonseeeee${response.statusCode}');
    if (response.statusCode == 200) {
      var jsonString = response.body;
      var data = barbersFromJson(jsonString);
      return data;
    } else {
      return null;
    }
  }

  static Future fetchBarberSearch(String searchKey) async {
    var response = await client
        .post(Uri.parse('https://www.ehsankatebi.ir/api/search'), body: {
      'phone': '$searchKey'
    }, headers: {
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMTMzMzhmMzAyNjFiZDc3ZDBiYTE4M2UwYTgxMDA5OTliOGIyMDhiNjFhOGJmZmI2ZTllMTdjMjhlNTlmNjY1OWY1NDQxMmJkMDRkYTkwYjMiLCJpYXQiOjE2MzI3MzI5MDQuNDU3MDU3LCJuYmYiOjE2MzI3MzI5MDQuNDU3MDY3LCJleHAiOjE2NjQyNjg5MDQuNDQ3Mjk1LCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.bSPzxWIA-e-YGN-kZBxvAzowY8yz1IMmTbaApkFW-PGajp0KDNxXSM81c-IPSnjfib7Y3ajE8gbC7maFTgTW8SoqYDGcanSQzhg8JKUqo5ywthiHp_zFteUOcUkiiybOJsrYKim7mnmONOrZ95pzm7cCsJp8MOV60gx4scxYWNpT6yxQeOaqWs0mSUy2bYvFE1UsvFJLh3jgw-8HZGFo0VY8ojuz-JXyJzwKNu-visvHmSY9Bg9AxA5aj3rH84bPZIQ_HxSOQz4EbmoYLtpu1S07M0ew6untH9VJ9oRCy4aUTdTsacU5AH2zzeVLSV7DfeGSeVi-8CNw9HDNf-jblx0H1j9qGw5KGEGxb3Jw2UzC-FjkvojzgQChXtc-IGVvRFRamN1fasQIaCpt3_2UtXLr6CvsPTRZue1VGo-VAd1Xo4toPvLY_JC1ugFO7Ij-CcnzW7VY83J7yizAAsK4Lu8lB7bD9C57JYV6iYxodz6PvfIEazht0iGlpVy_XNEeyr2qGtD4QUZ1nxaX5nOaThc08S8QVEozDkOqToUXA7c06ORzNhdWD9pPcp1XcoALFwWhlZPy9pyFvgGPr8micdY958wyASviasme_RsIq3LQCUlAnKG2Q1BoTZuvnLwfNR1w-QWypW522Wd5-BsXY5HAfqM3tJsUc3v4yZvdR0I',
      'Accept': 'application/json',
    });
    print(
        'ttthhheeeee fuuuucccckkkkinggggg reeeessppoooonseeeee${response.statusCode}');
    if (response.statusCode == 200) {
      var jsonString = response.body;
      var data = barbersFromJson(jsonString);
      return data;
    } else {
      return null;
    }
  }
}
