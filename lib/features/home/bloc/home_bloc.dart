import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:grocery/Data/grocery_data.dart';
import 'package:grocery/features/home/models/data_models.dart';
import 'package:grocery/features/home/ui/home.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWishlistButtonClickedEvent>(
        homeProductWishlistButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeCartButtonNavigatedEvent>(homeCartButtonNavigatedEvent);
    on<HomeWishlistButtonNavigatedEvent>(homeWishlistButtonNavigatedEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async{
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit( HomeLoadedSuccessState(
      products: GroceryData.groceryProducts.map((e) => ProductDataModel(
          name: e['name'],
          id: e['id'],
          description: e['description'],
          price: e['price'],
          imageurl: e['imageUrl'])).toList()));
  }

  FutureOr<void> homeProductWishlistButtonClickedEvent(
      HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    print("whishlist item  clicked");
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print("cart item  clicked");
  }

  FutureOr<void> homeCartButtonNavigatedEvent(
      HomeCartButtonNavigatedEvent event, Emitter<HomeState> emit) {
    print("Navigated to cart items page");
    emit(HomeNavigateToCartPageActionsState());
  }

  FutureOr<void> homeWishlistButtonNavigatedEvent(
      HomeWishlistButtonNavigatedEvent event, Emitter<HomeState> emit) {
    print("Navigated to wishlist items page");
    emit(HomeNavigateToWishlistPageActionsState());
  }


}
