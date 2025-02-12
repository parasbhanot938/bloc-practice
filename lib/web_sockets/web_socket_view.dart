import 'dart:convert';

import 'package:bloc_practice/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketsScreen extends StatefulWidget {
  const WebSocketsScreen({Key? key}) : super(key: key);

  @override
  State<WebSocketsScreen> createState() => _WebSocketsScreenState();
}

class _WebSocketsScreenState extends State<WebSocketsScreen> {
  final channel =
      WebSocketChannel.connect(Uri.parse('wss://ws-feed.pro.coinbase.com'));
  var nameController = TextEditingController();
  var nameNode = FocusNode();

  Artboard? riveArtboard;
  SMIBool? isDance;
  SMITrigger? isLookUp;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    channel.sink.close();
  }

  @override
  void initState() {
    // TODO: implement initState
    // rootBundle.load(key)
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Expanded(
            child: RiveAnimation.network(
              'https://public.rive.app/community/runtime-files/2191-4327-loader-solicitud-de-cuentas.riv',
            ),
          ),
          commonTextField(
            placeholder: "Enter Name",
            controller: nameController,
            focusNode: nameNode,
            padding: EdgeInsets.all(0),
            onChanged: (value) {},
            title: "Name",
            isMandatory: true,
            keyboardTyoe: TextInputType.emailAddress,
          ),
          TextButton(
              onPressed: () {
                if (nameController.text.isEmpty) return;
                channel.sink.add(
                  jsonEncode(
                    {
                      "type": "subscribe",
                      "channels": [
                        {
                          "name": nameController.text.toString(),
                          "product_ids": [
                            "BTC-EUR",
                          ]
                        }
                      ]
                    },
                  ),
                );
              },
              child: Text("Done")),
          StreamBuilder(
            stream: channel.stream,
            builder: (context, snapshot) {
              if (snapshot.hasData)
                return Text(jsonDecode(snapshot.data.toString()).toString());
              else if (snapshot.hasError) return Text("Error aa gya bhauu");

              return SizedBox();
            },
          )
        ],
      ),
    ));
  }
}
