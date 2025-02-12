import 'dart:convert';
import 'dart:developer';

import 'package:bloc_practice/features/posts/models/post_model.dart';
import 'package:http/http.dart' as http;

class PostRepo {


  /*============================================Fetch Posts Api===================================================*/
  static Future<List<PostModel>> fetchPostsApi() async {
    var client = http.Client();
    List<PostModel> postList = [];
    try {
      var response = await client.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      );

      List result = jsonDecode(response.body);

      for (int i = 0; i < result.length; i++) {
        var postModel = PostModel.fromJson(result[i]);
        postList.add(postModel);
      }

      print("my list-------->  ${postList}");
      return postList;
    } catch (e) {

      print(e.toString());
      return [];
    }
  }



}
