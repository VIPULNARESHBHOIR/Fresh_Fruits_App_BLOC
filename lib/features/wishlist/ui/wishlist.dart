import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:grocery/features/wishlist/ui/wishlist_card_item_widget.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  final WishlistBloc wishlistBloc = WishlistBloc();

  @override
  void initState(){
    wishlistBloc.add(WishlistInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Items',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w900,
            fontFamily: 'Raleway', // Stylish Font
            color: Colors.white,
          ),),
        backgroundColor: Color(0xFF316300),
      ),
      body: BlocConsumer<WishlistBloc, WishlistState>(
        bloc: wishlistBloc,
        listenWhen: (previous, current) => current is! WishlistState,
        buildWhen: (previous, current) => current is WishlistState,
        listener: (context, state){

        },
        builder: (context, state){
          switch(state.runtimeType){
            case WishlistLoadingState:
              return Scaffold( body:
              Center(
                child: CircularProgressIndicator(),
              ));

            case WishlistLoadedState:
              final successState = state as WishlistLoadedState;
              return Container(color: Color(0xC2558C00),
                child: ListView.builder(
                    itemCount: successState.wishlist_items.length,
                    itemBuilder: (context, index) {
                      return WishlistTileWidget(
                          wishlistBloc: wishlistBloc,
                          productDataModel: successState.wishlist_items[index]);
                    }),
              );

            default:
              return SizedBox();
          }
          return SizedBox();
        },
      )
    );
  }
}
