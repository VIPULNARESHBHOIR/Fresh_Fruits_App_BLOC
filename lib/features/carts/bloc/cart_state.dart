part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

abstract class CartActionState extends CartState{}

final class CartInitial extends CartState {}

final class CartsLoadingState extends CartState{}

final class CartsLoadedState extends CartState{
  final List<ProductDataModel> cart_Items;
  CartsLoadedState({
    required this.cart_Items,
  });
}

final class ErrorState extends CartState{}



