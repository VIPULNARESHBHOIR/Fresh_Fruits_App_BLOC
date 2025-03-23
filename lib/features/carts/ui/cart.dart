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
              return successState.cart_Items.isNotEmpty
                  ? Container(
                color: Color(0xC2558C00),
                child: ListView.builder(
                  itemCount: successState.cart_Items.length,
                  itemBuilder: (context, index) {
                    return CartTileWidget(
                      cartBloc: cartBloc,
                      productDataModel: successState.cart_Items[index],
                    );
                  },
                ),
              )
                  : Container(
                color: Color(0xC2558C00),
                    child: Center(
                                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.shopping_cart_outlined,
                        size: 100,
                        color: Colors.blue,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Your Cart is Empty!',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Raleway', // Stylish Font
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Start shopping and add fruits to your cart.',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                                    ),
                                  ),
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
