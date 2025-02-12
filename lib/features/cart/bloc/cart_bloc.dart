import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_practice/features/cart/model.dart';
import 'package:bloc_practice/features/home/models/product_model.dart';

import 'package:meta/meta.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialFetchEvent>(cartInitialFetchEvent);
    on<CartRemoveFromCartEvent>(cartRemoveFromCartEvent);
  }

  Future<FutureOr<void>> cartInitialFetchEvent(
      CartInitialFetchEvent event, Emitter<CartState> emit) async {
    emit(CartLoadingState());
    await Future.delayed(Duration(seconds: 2));
    emit(CartSuccessState(cartItems: cartList));
  }

  FutureOr<void> cartRemoveFromCartEvent(
      CartRemoveFromCartEvent event, Emitter<CartState> emit) {
    cartList.remove(event.productModel);
    emit(CartSuccessState(cartItems: cartList));
  }
}
