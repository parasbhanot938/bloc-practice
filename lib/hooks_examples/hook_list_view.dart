import 'package:bloc_practice/hooks_examples/model_list_hook.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HookListView extends HookWidget {
  const HookListView({super.key});

  @override
  Widget build(BuildContext context) {
    final hookList = useModalList(context);
    return Scaffold(
        appBar: AppBar(
            title: Text(
          "Custom hook",
          style: TextStyle(fontSize: 18, color: Colors.red[200]),
        )),
        body: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 15),
          shrinkWrap: true,
          itemCount: hookList.length,
          itemBuilder: (context, index) => Card(

              // height: MediaQuery.of(context).size.height,
              // padding: EdgeInsets.symmetric(horizontal: 15,vertical: 8),
              //   decoration: BoxDecoration(
              //     color: Colors.red[200]
              //   ),
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8.0),
            child: Text(hookList[index].name),
          )),
        )
        // hookList.map((e) => Text(e.name));,
        );
  }
}
