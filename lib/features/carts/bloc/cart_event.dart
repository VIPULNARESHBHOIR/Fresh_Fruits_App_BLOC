part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class CartsInitialEvent extends CartEvent{}

class CartRemoveButtonClickedEvent extends CartEvent{
  final ProductDataModel remove_product;
  CartRemoveButtonClickedEvent({
    required this.remove_product,
});
}


