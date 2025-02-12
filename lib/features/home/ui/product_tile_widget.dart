
import 'package:bloc_practice/features/home/bloc/home_bloc.dart';
import 'package:bloc_practice/features/home/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductTileWidget extends StatelessWidget {
  ProductModel productData;

  HomeBloc homeBloc;

  ProductTileWidget(
      {Key? key, required this.productData, required this.homeBloc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
          color: Colors.teal.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1.0,
                blurRadius: 1.0)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${productData.name}"),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {
                    homeBloc.add(HomeWishlistButtonClickedEvent(
                        addedWishButtonList: productData));
                  },
                  icon: Icon(Icons.favorite_border)),
              IconButton(
                  onPressed: () {
                    homeBloc.add(HomeCartButtonClickedEvent(
                        addedCartButtonList: productData));
                  },
                  icon: Icon(Icons.shopping_cart_outlined)),
            ],
          )
        ],
      ),
    );
  }
}
