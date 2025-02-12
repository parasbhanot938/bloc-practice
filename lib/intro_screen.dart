import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("sds")),
      body: Column(
        children: [
          SvgPicture.asset(
            fit: BoxFit.fill,
            'assets/images/coffe1.svg',
            width: 300,
            height: 300,
          ),
          Container(
            height: 200,
            width: 200,
            color: Colors.pink,
          )
        ],
      ),
    );
  }
}

