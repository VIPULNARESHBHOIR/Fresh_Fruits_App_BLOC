part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent{

}

class HomeProductWishlistButtonClickedEvent extends HomeEvent{
  final ProductDataModel product;
  HomeProductWishlistButtonClickedEvent({
    required this.product,
  });
}

class HomeProductCartButtonClickedEvent extends HomeEvent{
  final ProductDataModel product;
  HomeProductCartButtonClickedEvent({
    required this.product,
  });
}

class HomeWishlistButtonNavigatedEvent extends HomeEvent{

}

class HomeCartButtonNavigatedEvent extends HomeEvent{

}


