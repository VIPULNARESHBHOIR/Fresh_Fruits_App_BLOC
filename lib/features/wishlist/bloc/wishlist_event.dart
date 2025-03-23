part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistEvent {}

class WishlistInitialEvent extends WishlistEvent {}

class WishlistItemRemoveEvent extends WishlistEvent {
  final ProductDataModel removed_product;
  WishlistItemRemoveEvent({required this.removed_product});
}
