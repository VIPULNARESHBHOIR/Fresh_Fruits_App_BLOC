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
        foregroundColor: Colors.white,
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
              return successState.wishlist_items.isNotEmpty? Container(color: Color(0xC2558C00),
                child: ListView.builder(
                    itemCount: successState.wishlist_items.length,
                    itemBuilder: (context, index) {
                      return WishlistTileWidget(
                          wishlistBloc: wishlistBloc,
                          productDataModel: successState.wishlist_items[index]);
                    }),
              ):
              Container(
                color: Color(0xC2558C00),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.favorite_border_outlined,
                        size: 100,
                        color: Colors.red,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Opps No Fruits!',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Raleway', // Stylish Font
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Start adding fruits to your favorite.',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                ),
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
