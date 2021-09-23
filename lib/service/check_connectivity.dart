import 'package:http/http.dart' as http;

class CheckConnectivity {
  static var client = http.Client();

  static Future checkNet() async {
    final String url = 'https://jsonplaceholder.typicode.com/todos/1';
    print('fuck ur cooode');
    var response = await http.get(Uri.parse(url));
    print('fuck ur code ${response.statusCode}');
    return response.statusCode;
  }
}
