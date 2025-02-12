import 'dart:async';

import 'package:bloc_practice/hooks_examples/test_hook.dart';
import 'package:bloc_practice/hooks_examples/timer_hook.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';

class CounterHook extends HookWidget {
  CounterHook({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = useTestHook(context);

    // useEffect(() => () {
    //
    //   final timer=Timer.periodic(Duration(seconds: 1), (timer) {
    //     counter.value=timer.tick;
    //     return timer.cancel();
    //   });
    // },const []);
    return Scaffold(
      appBar: AppBar(title: Text("Hook")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            counter.toString(),
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.red[200]),
          )),
          // SizedBox(height: 20,child: Container(
          //   color: Colors.pink,
          // )),
          // TextButton(
          //     style: ButtonStyle(),
          //     onPressed: () {
          //   counter.value++;
          //
          // }, child: Text("add"))
        ],
      ),
    );
  }
}

