import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../Data/favorites_items.dart';
import '../../home/models/data_models.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistInitialEvent>(wishlistInitialEvent);
    on<WishlistItemRemoveEvent>(wishlistItemRemoveEvent);
  }

  FutureOr<void> wishlistInitialEvent(
      WishlistInitialEvent event, Emitter<WishlistState> emit) async {
    emit(WishlistLoadingState());
    await Future.delayed(Duration(seconds: 1));
    emit(WishlistLoadedState(
      wishlist_items: favorite_Item,
    ));
  }

  FutureOr<void> wishlistItemRemoveEvent(
      WishlistItemRemoveEvent event, Emitter<WishlistState> emit) {
      favorite_Item.remove(event.removed_product);
      emit(WishlistLoadedState(
        wishlist_items: favorite_Item,
      ));
  }
}
