import 'package:bloc_practice/mvc_pattern/user_model.dart';
import 'package:flutter/material.dart';

class UserView extends StatelessWidget {
  UserModel userModel;

  UserView({Key? key, required this.userModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
    Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text("Name: ${userModel.name}"),
          Text("Age: ${userModel.age}"),
        ]),
    );


  }
}
