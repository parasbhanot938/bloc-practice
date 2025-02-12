import 'package:bloc_practice/mvc_pattern/user_model.dart';
import 'package:bloc_practice/mvc_pattern/user_view.dart';
import 'package:flutter/material.dart';

class UserController extends StatefulWidget {
  UserController({Key? key}) : super(key: key);

  @override
  State<UserController> createState() => _UserControllerState();
}

class _UserControllerState extends State<UserController> {
  final userModel = UserModel(name: "Bolt", age: 26,);

  List<UserModel> userList=[
    UserModel(name: "X", age: 24),
    UserModel(name: "Y", age: 21),
    UserModel(name: "Z", age: 22),
  ];

  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    userModel.name.contains("B")
        ? userModel.name = "Taylor"
        : userModel.name = "";
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: UserView(userModel: userModel),
    );
  }
}

