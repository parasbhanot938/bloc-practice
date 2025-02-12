part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionState extends HomeState{

}
class HomeInitial extends HomeState {}


class HomeLoadingState extends HomeState{

}

class HomeLoadedSuccessState extends HomeState{

    List<ProductModel> productList;

  HomeLoadedSuccessState({
    required this.productList
});




}


class HomeErrorState extends HomeState{

}

class HomeNavigateToWishListPageActionState extends HomeActionState{

}

class HomeNavigateToCartPageActionState extends HomeActionState{

}


class HomeWishListedActionState extends HomeActionState{

}
class HomeCartedListedActionState extends HomeActionState{

}