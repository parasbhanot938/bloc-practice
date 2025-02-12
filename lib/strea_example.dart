import 'package:flutter/material.dart';

class StreamExample extends StatefulWidget {
  StreamExample({super.key});

  @override
  State<StreamExample> createState() => _StreamExampleState();
}

class _StreamExampleState extends State<StreamExample> {
  List<int> list = [];
  ScrollController controller = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getStreamValues();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Stream example")),
        body: StreamBuilder(

          stream: getValues(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Center(
                  child: Text(
                snapshot.data.toString(),
                style: TextStyle(fontSize: 14, color: Colors.pink),
              ));
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }

            return SizedBox();
          },
        )

        /*ListView.separated(
            controller: controller,
            padding: EdgeInsets.symmetric(horizontal: 20),
            shrinkWrap: true,
            itemBuilder: (context, index) => Text(list[index].toString()),
            separatorBuilder: (context, index) => SizedBox(
                  height: 10,
                ),
            itemCount: list.length)*/
        );
  }

  Stream<int> getValues() async* {
    for (int i = 0; i < 9; i++) {
      await Future.delayed(Duration(seconds: 1));
      yield i;
    }
  }

  Future<int> getFuture() async => 5;

  Future<void> getStreamValues() async {
    await for (final element in getValues()) {
      // list.add(element);
      // setState(() {});
      // ;

      print(element);
    }
  }
}
