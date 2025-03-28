part of 'my_product_bloc.dart';

@immutable
abstract class MyProductEvent {}

class MyProductInitialEvent extends MyProductEvent{}

class BottomScrollHitEvent extends MyProductEvent{
  final int limit;
  final int skip;

  BottomScrollHitEvent({required this.limit, required this.skip});
}


