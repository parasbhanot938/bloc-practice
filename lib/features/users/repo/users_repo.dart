import 'dart:convert';
import 'dart:developer';
import 'package:bloc_practice/features/todos/model/todo_model.dart';
import 'package:bloc_practice/features/users/modal/UserModal.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class UsersRepo {



  static Future<List<UsersData>> getUsers() async {
    try {
      var response = await http
          .get(Uri.parse("https://reqres.in/api/users?page=1"));

      if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body.toString());

      List<dynamic> usersList=responseData['data'];

        debugPrint("users response --> ${responseData}");

        List<UsersData> fetchedUsersList =
        usersList.map((e) => UsersData.fromJson(e)).toList();

        return fetchedUsersList;
      }
    } catch (e) {
      log("Error---> ${e}");
      return [];
    }
    return [];
  }




  static Future<TodoModel> todoById({required String id}) async {
    try {
      var response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/todos/$id"));

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body.toString());

        debugPrint("tood response by id --> ${responseData}");



        return TodoModel.fromJson(responseData);
      }
    } catch (e) {
      log("Error---> ${e}");
      return TodoModel();
    }
    return TodoModel();
  }
}
