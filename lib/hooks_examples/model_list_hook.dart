
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';



List<Student> useModalList(BuildContext context){
  return use(_ModalList());
}


class _ModalList extends Hook<List<Student>> {

  @override
  _ModalListState createState() => _ModalListState();
}

class _ModalListState extends HookState<List<Student>,_ModalList> {
  List<Student> list=[];
  @override
  void initHook() {
    // TODO: implement initHook
    super.initHook();
    list
        ..add(Student(name: "User 1", id: 12))
        ..add(Student(name: "User 2", id: 11))
        ..add(Student(name: "User 3", id: 11));
    setState(() { });
  }
  @override
  List<Student> build(BuildContext context) {
    return list;
  }
}


class Student {
  String name;
  int id;

  Student({required this.name, required this.id});
}

