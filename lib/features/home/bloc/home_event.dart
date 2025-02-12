part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialFetchEvent extends HomeEvent{

}

class HomeWishlistButtonClickedEvent extends HomeEvent{

  ProductModel addedWishButtonList;

  HomeWishlistButtonClickedEvent({required this.addedWishButtonList});

}

class HomeCartButtonClickedEvent extends HomeEvent{

  ProductModel addedCartButtonList;

  HomeCartButtonClickedEvent({required this.addedCartButtonList});

}


class HomeWishlistButtonNavigatorEvent extends HomeEvent{

}
class HomeCartButtonNavigatorEvent extends HomeEvent{

}