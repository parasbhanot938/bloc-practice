part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

abstract class CartActionState extends CartState{

}

class CartInitial extends CartState {}

class CartSuccessState extends CartState{

   List<ProductModel> cartItems;

   CartSuccessState({required this.cartItems});


}
class CartLoadingState extends CartState{

}

class CartErrorState extends CartState{

}


