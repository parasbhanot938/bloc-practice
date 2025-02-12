import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class LoginRepo {
  /*====================================Login Api===================================*/
  static Future<String> loginApi(
      {required String email, required String password}) async {
    try {
      var response =
          await http.post(Uri.parse("https://reqres.in/api/login"), body: {
        "email": email,
        "password": password,
      });

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body.toString());

        var val = responseData['token'];

        return val;
      }
    } catch (e) {
      log("error--> $e");
      return "";
    }

    return "";
  }
}
