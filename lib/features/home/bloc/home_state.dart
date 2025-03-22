part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeStateActions extends HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState{}

class HomeLoadedSuccessState extends HomeState{
  final List<ProductDataModel> products;
  HomeLoadedSuccessState({
    required this.products,
});

}

class HomeErrorState extends HomeState{}


class HomeNavigateToWishlistPageActionsState extends HomeStateActions{}

class HomeNavigateToCartPageActionsState extends HomeStateActions{}



