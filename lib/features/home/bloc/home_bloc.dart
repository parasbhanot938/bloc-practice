import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_practice/features/cart/model.dart';
import 'package:bloc_practice/features/data/my_data.dart';
import 'package:bloc_practice/features/data/wishlist_items.dart';
import 'package:bloc_practice/features/home/models/product_model.dart';

import 'package:meta/meta.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialFetchEvent>(homeInitialFetchEvent);
    on<HomeWishlistButtonNavigatorEvent>(homeWishlistButtonNavigatorEvent);
    on<HomeCartButtonNavigatorEvent>(homeCartButtonNavigatorEvent);
    on<HomeWishlistButtonClickedEvent>(homeWishlistButtonClickedEvent);
    on<HomeCartButtonClickedEvent>(homeCartButtonClickedEvent);
  }

  FutureOr<void> homeInitialFetchEvent(
      HomeInitialFetchEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());

    await Future.delayed(
      Duration(seconds: 2),
      () {},
    );

    emit(HomeLoadedSuccessState(
        productList: MyData.list
            .map((e) => ProductModel(
                id: e['id'].toString(),
                name: e['name'].toString(),
                description: e['description'].toString()))
            .toList()));
  }
}

FutureOr<void> homeWishlistButtonNavigatorEvent(
    HomeWishlistButtonNavigatorEvent event, Emitter<HomeState> emit) {
  print("Wish button clicked");

  emit(HomeNavigateToWishListPageActionState());
}

FutureOr<void> homeCartButtonNavigatorEvent(
    HomeCartButtonNavigatorEvent event, Emitter<HomeState> emit) {
  print("Cart button clicked");
  emit(HomeNavigateToCartPageActionState());
}

FutureOr<void> homeWishlistButtonClickedEvent(
    HomeWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
  print("Wish button clicked in list");
  wishList.add(event.addedWishButtonList);

  emit(HomeWishListedActionState());
}

FutureOr<void> homeCartButtonClickedEvent(
    HomeCartButtonClickedEvent event, Emitter<HomeState> emit) {
  print("cart button clicked in list");
  cartList.add(event.addedCartButtonList);

  emit(HomeCartedListedActionState());
}
