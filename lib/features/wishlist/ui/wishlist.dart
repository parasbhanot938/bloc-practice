import 'package:flutter/material.dart';

class WishList extends StatefulWidget {
  const WishList({Key? key}) : super(key: key);

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text("Wishlist",style: TextStyle(fontSize: 20),),

            ),
          ),
        ],
      ),
    );;
  }
}
