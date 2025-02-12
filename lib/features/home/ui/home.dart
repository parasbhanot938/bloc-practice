import 'package:bloc_practice/features/cart/ui/cart.dart';
import 'package:bloc_practice/features/home/bloc/home_bloc.dart';
import 'package:bloc_practice/features/home/ui/product_tile_widget.dart';
import 'package:bloc_practice/features/wishlist/ui/wishlist.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    homeBloc.add(HomeInitialFetchEvent());
  }

  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToWishListPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Cart()));
        } else if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => WishList()));
        } else if (state is HomeWishListedActionState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Item WishListed")));
        } else if (state is HomeCartedListedActionState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Item Carted")));
        }
        // TODO: implement listener
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );

          case HomeLoadedSuccessState:
            final successStateEmit = state as HomeLoadedSuccessState;

            return Scaffold(
              appBar: AppBar(
                title: Text("Bloc Example"),
                actions: [
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeWishlistButtonNavigatorEvent());
                      },
                      icon: Icon(Icons.favorite_border)),
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeCartButtonNavigatorEvent());
                      },
                      icon: Icon(Icons.shopping_bag_outlined))
                ],
              ),
              body: ListView.builder(
                shrinkWrap: true,
                itemCount: successStateEmit.productList.length,
                itemBuilder: (context, index) {
                  return ProductTileWidget(
                    productData: successStateEmit.productList[index],
                    homeBloc: homeBloc,
                  );
                },
              ),
            );

          case HomeErrorState:
            return Scaffold(
              body: Center(
                child: Text("Error Occured"),
              ),
            );
          default:
            return SizedBox();
        }
      },
    );
  }
}

