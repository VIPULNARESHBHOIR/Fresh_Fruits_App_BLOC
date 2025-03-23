import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:grocery/Data/cart_items.dart';
import 'package:meta/meta.dart';

import '../../home/models/data_models.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartsInitialEvent>(cartsInitialEvent);
    on<CartRemoveButtonClickedEvent>(cartRemoveButtonClickedEvent);
  }



FutureOr<void> cartsInitialEvent(
    CartsInitialEvent event, Emitter<CartState> emit) async {
  emit(CartsLoadingState());
  await Future.delayed(Duration(seconds: 1));
  emit(CartsLoadedState(
    cart_Items: cart_Itemslist,
  ));
}

  FutureOr<void> cartRemoveButtonClickedEvent(
      CartRemoveButtonClickedEvent event, Emitter<CartState> emit) {
    cart_Itemslist.remove(event.remove_product);
    emit(CartsLoadedState(
      cart_Items: cart_Itemslist,
    ));
  }
}