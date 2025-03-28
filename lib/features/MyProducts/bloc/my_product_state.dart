part of 'my_product_bloc.dart';

@immutable
abstract class MyProductState {}

final class MyProductInitial extends MyProductState {}

final class MyProductLoadingState extends MyProductState{}

final class MyProductLoadedState extends MyProductState{}

final class LoadingFailed extends MyProductState{}
