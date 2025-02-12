import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

String useTestHook(BuildContext context) {
  return use(_TestHook());
}

class _TestHook extends Hook<String> {
  @override
  _TestHookState createState() => _TestHookState();
}

class _TestHookState extends HookState<String, _TestHook> {
  String test = "";

  @override
  void initHook() {
    // TODO: implement initHook
    super.initHook();

    test = "F";

    setState(() {});
  }

  String build(BuildContext context) {
    return test;
  }
}

