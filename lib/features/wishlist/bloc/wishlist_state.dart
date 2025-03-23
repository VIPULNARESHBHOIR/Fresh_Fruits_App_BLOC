part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistState {}

final class WishlistInitial extends WishlistState {}

final class  WishlistLoadingState extends WishlistState{}

final class  WishlistLoadedState extends WishlistState{
  final List<ProductDataModel> wishlist_items;
  WishlistLoadedState({
    required this.wishlist_items,
});
}

final class  ErrorState extends WishlistState{

}