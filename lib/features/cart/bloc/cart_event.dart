
part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class CartInitialFetchEvent extends CartEvent {}

class CartRemoveFromCartEvent extends CartEvent {
  final ProductModel productModel;

  CartRemoveFromCartEvent({required this.productModel});
}




