import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/features/carts/bloc/cart_bloc.dart';

import 'cart_product_card_widget.dart';

class CartItems extends StatefulWidget {
  const CartItems({super.key});

  @override
  State<CartItems> createState() => _CartItemsState();
}

class _CartItemsState extends State<CartItems> {
  final CartBloc cartBloc = CartBloc();

  @override
  void initState(){
    cartBloc.add(CartsInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text('Cart Items',
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w900,
          fontFamily: 'Raleway', // Stylish Font
          color: Colors.white,
        ),),
      backgroundColor: Color(0xFF316300),
    ),
    body: BlocConsumer<CartBloc, CartState>(
      bloc: cartBloc,
      listenWhen: (previous, current)=> current is CartActionState,
      buildWhen: (previous, current)=> current is! CartActionState,
      listener: (context, state){

      },

      builder: (context, state){
          switch(state.runtimeType){
            case CartsLoadingState:
              return Scaffold( body:
              Center(
                child: CircularProgressIndicator(),
              ));

            case CartsLoadedState:
              final successState = state as CartsLoadedState;
              return Container(color: Color(0xC2558C00),
                child: ListView.builder(
                    itemCount: successState.cart_Items.length,
                    itemBuilder: (context, index) {
                      return CartTileWidget(
                          cartBloc: cartBloc,
                          productDataModel: successState.cart_Items[index]);
                    }),
              );

            default:
              return SizedBox();

          }
          return Container();
        },
    )
    );
  }
}
