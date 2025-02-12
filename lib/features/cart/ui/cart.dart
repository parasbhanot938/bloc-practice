
import 'package:bloc_practice/features/cart/bloc/cart_bloc.dart';
import 'package:bloc_practice/features/cart/ui/cart_tile.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  var cartblock = CartBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cartblock.add(CartInitialFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart Itemsd"),
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartblock,
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {

          switch (state.runtimeType) {
            case CartLoadingState:
              return Center(
                child: CircularProgressIndicator(),
              );

            case CartSuccessState:

              var successState=state as  CartSuccessState;
              return  Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: successState.cartItems.length,
                    itemBuilder: (context, index) {
                      return CartTileWidget(productData: successState.cartItems[index],cartBloc: cartblock, );

                    },),
                ],
              );




          }
return Container();

        },
      ),
    );
  }
}
