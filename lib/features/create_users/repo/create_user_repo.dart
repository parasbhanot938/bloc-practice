import 'dart:convert';

import 'package:bloc_practice/features/create_users/model/create_user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class CreateUserRepo {
  static Future<CreateUserModel> createUser(
      {required String name, required String job}) async {
    try {
      var response =
          await http.post(Uri.parse("https://reqres.in/api/users"), body: {
        "name": name,
        "job": job,
      });

      if (response.statusCode == 201) {
        var jsonResponse = jsonDecode(response.body.toString());

        debugPrint("response of create user --> ${jsonEncode(jsonResponse)}");


        return CreateUserModel.fromJson(jsonResponse);
      }
    } catch (e) {

      debugPrint("error--> $e");
      return CreateUserModel();
    }

    return CreateUserModel();
  }
}


