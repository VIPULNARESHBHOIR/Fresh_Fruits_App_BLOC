part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent{

}

class HomeProductWishlistButtonClickedEvent extends HomeEvent{

}

class HomeProductCartButtonClickedEvent extends HomeEvent{

}

class HomeWishlistButtonNavigatedEvent extends HomeEvent{

}

class HomeCartButtonNavigatedEvent extends HomeEvent{

}


