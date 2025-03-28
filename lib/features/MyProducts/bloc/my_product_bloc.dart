import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../../../Data/myproducts.dart';
import '../data_models/ProductDataModel.dart';

part 'my_product_event.dart';
part 'my_product_state.dart';

class MyProductBloc extends Bloc<MyProductEvent, MyProductState> {
  List<Product> products = [];  // Store the products in the bloc

  MyProductBloc() : super(MyProductInitial()) {
    on<BottomScrollHitEvent>(bottomScrollHitEvent);
  }

  FutureOr<void> bottomScrollHitEvent(
      BottomScrollHitEvent event, Emitter<MyProductState> emit) async {
    const String baseUrl = "https://dummyjson.com/products";
    print("----------------------------------------------------limit=${event.limit}&skip=${event.skip}--------------------------------------------");
    try {
      // Don't emit a loading state, just add new data silently
      final response = await http.get(
          Uri.parse("$baseUrl?limit=${event.limit}&skip=${event.skip}"));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        List<Product> newProducts = (data['products'] as List)
            .map((json) => Product.fromJson(json))
            .toList();

        products.addAll(newProducts); // Append new products

        // Emit new state without resetting the screen
        emit(MyProductLoadedState(products: List.from(products)));
      } else {
        emit(LoadingFailed());
      }
    } catch (e) {
      emit(LoadingFailed());
    }
  }

}
