import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';

class TestView extends StatefulWidget {
  const TestView({super.key});

  @override
  State<TestView> createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {
  Color baseColor = Color(0xFFF2F2F2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("app bar"),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: ClayContainer(
              width: MediaQuery.of(context).size.width,
              height: 150.0,
              color: baseColor,
              // curveType: CurveType.none,
              emboss: true,
              borderRadius: 5,

              child: Center(
                  child: ClayText(
                "Hi",
                emboss: true,
                size: 30,
              )),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClayContainer(
                color: baseColor,
                height: 70,
                width: 70,
                borderRadius: 75,
                curveType: CurveType.concave,
              ),
              SizedBox(width: 50),
              ClayContainer(
                color: baseColor,
                height: 70,
                width: 70,
                borderRadius: 75,
                curveType: CurveType.none,
              ),
              SizedBox(width: 50),
              ClayContainer(
                color: baseColor,
                height: 70,
                width: 70,
                borderRadius: 75,
                curveType: CurveType.convex,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

