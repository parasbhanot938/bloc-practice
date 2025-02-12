import 'package:flutter/material.dart';

class SeeAll extends StatefulWidget {
  const SeeAll({Key? key}) : super(key: key);

  @override
  State<SeeAll> createState() => _SeeAllState();
}

class _SeeAllState extends State<SeeAll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("See All")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("See All")
        ],
      ),
    );
  }
}
