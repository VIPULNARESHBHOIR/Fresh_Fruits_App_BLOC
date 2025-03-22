import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/features/home/bloc/home_bloc.dart';

import '../../products/ui/cart.dart';
import '../../wishlist/ui/wishlist.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState(){
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();

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
      },
      builder: (context, state) {
        switch(state.runtimeType){
          case HomeLoadingState:
            return Scaffold( body:
            Center(
              child: CircularProgressIndicator(),
            ));

          case HomeLoadedSuccessState:
            return Scaffold(
              appBar: AppBar(
                title: Text('Grocery App'),
                actions: [
                  IconButton(onPressed: () {
                    homeBloc.add(HomeCartButtonNavigatedEvent());
                  },
                      icon: Icon(Icons.shopping_basket)),
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeWishlistButtonNavigatedEvent());
                      },
                      icon: Icon(Icons.favorite_border_outlined)),
                ],
                backgroundColor: Colors.blueGrey,
              ),
              body: Center(
                child: Text('Grocery Items here'),
              ),
            );

          case HomeErrorState:
            return Scaffold(
              body: Center(
                child: Text('Network Error'),
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
