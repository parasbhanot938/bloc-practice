import 'dart:convert';
import 'dart:developer';
import 'package:bloc_practice/features/todos/model/todo_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class TodoRepo {



  static Future<List<TodoModel>> getTodos() async {
    try {
      var response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/todos"));

      if (response.statusCode == 200) {
        List<dynamic> responseData = jsonDecode(response.body.toString());
        
        debugPrint("tood response --> ${responseData}");

        List<TodoModel> todoList =
            responseData.map((e) => TodoModel.fromJson(e)).toList();

        return todoList;
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
