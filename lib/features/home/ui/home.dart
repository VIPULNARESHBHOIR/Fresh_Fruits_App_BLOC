import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/features/home/bloc/home_bloc.dart';
import 'package:grocery/features/home/ui/product_card_widget.dart';

import '../../carts/ui/cart.dart';
import '../../wishlist/ui/wishlist.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeBloc homeBloc = HomeBloc();

  @override
  void initState(){
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeStateActions,
      buildWhen: (previous, current) => current is! HomeStateActions,
      listener: (context, state) {
        if(state is HomeNavigateToWishlistPageActionsState){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> Wishlist()));
        }
        else if(state is HomeNavigateToCartPageActionsState){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> CartItems()));
        }
        else if(state is ItemAddedToCartlistState){
           ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(
             child: Row(
               children: [
                 Container(
                     child: Icon(Icons.shopping_cart, color: Colors.blue)),
                 SizedBox(width: 10,),
                 Text(
                   'Item added to the Cart',
                 ),
               ],
             ),
           )));
        }
        else if (state is ItemAddedToWishlistState){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(
            child: Row(
              children: [
                Icon(Icons.favorite, color: Colors.red),
                SizedBox(width: 10,),
                Text(
                  'Item added to the Cart',
                ),
              ],
            ),
          ),
          ));
        }
      },
      builder: (context, state) {
        switch(state.runtimeType){
          case HomeLoadingState:
            return Scaffold( body:
            Center(
              child: CircularProgressIndicator(),
            ));

          case HomeLoadedSuccessState:
            final home_success_state = state as HomeLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                title: Text('Fresh Fruits',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Raleway', // Stylish Font
                    color: Colors.white,
                  ),
                ),
                actions: [
                  IconButton(onPressed: () {
                    homeBloc.add(HomeCartButtonNavigatedEvent());
                  },
                      icon: Icon(Icons.shopping_cart, color: Colors.blue,)),
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeWishlistButtonNavigatedEvent());
                      },
                      icon: Icon(Icons.favorite, color: Colors.red,)),
                ],
                backgroundColor: Color(0xFF316300),
              ),
              body: Container(color: Color(0xC2558C00) ,
                child: ListView.builder( itemCount: home_success_state.products.length,
                    itemBuilder: (context, index){
                  return ProductTileWidget(homeBloc: homeBloc,productDataModel: home_success_state.products[index]);
                }),
              )
            );

          case HomeErrorState:
            return Scaffold(
              body: Center(
                child: Text('Network Error Occured'),
              ),
            );

          default:
            return SizedBox(
            );
            break;
        }

      },
    );
  }
}
