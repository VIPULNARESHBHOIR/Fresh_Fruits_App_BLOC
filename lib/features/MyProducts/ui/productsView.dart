import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/Data/myproducts.dart';
import 'package:grocery/features/MyProducts/bloc/my_product_bloc.dart';
import 'package:grocery/features/MyProducts/ui/myProduct_card_widget.dart';


class PaginationScreen extends StatefulWidget {
  @override
  _PaginationScreenState createState() => _PaginationScreenState();
}

class _PaginationScreenState extends State<PaginationScreen> {
  final MyProductBloc myProductBloc = MyProductBloc();

  // final ApiService apiService = ApiService();
  int page = 0;
  final int limit = 5;
  bool isLoading = false;
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController()..addListener(_scrollListener);

    if (!isLoading) {
      setState(() => isLoading = true);

      print('${limit} ${page}');
      myProductBloc.add(BottomScrollHitEvent(limit: limit, skip: page * limit));

      setState(() {
        page++;
        isLoading = false;
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose(); // Clean up controller
    super.dispose();
  }

  void _scrollListener() {
    print("Scrolled to: ${_scrollController.position.pixels}");
    print("Max Scroll Extent: ${_scrollController.position.maxScrollExtent}");

    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 200 &&
        !isLoading) {

      if (!isLoading) {
        setState(() => isLoading = true);

        myProductBloc.add(BottomScrollHitEvent(limit: limit, skip: page * limit));

        setState(() {
          page++;
          isLoading = false;
        });
      }
    }
  }

  // Future<void> fetchMoreProducts() async {
  //   if (!isLoading) {
  //     setState(() => isLoading = true);
  //
  //     List<Product> newProducts =
  //         await apiService.fetchProducts(limit, page * limit);
  //     setState(() {
  //       products.addAll(newProducts);
  //       page++;
  //       isLoading = false;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xDB003D59),
      appBar: AppBar(title: Text("MyProducts",
      style: TextStyle(
         color: Colors.white,
      ),),
        backgroundColor:  Color(0xDB002130),),
      body: BlocBuilder<MyProductBloc, MyProductState>(
    bloc: myProductBloc,
    builder: (context, state) {
      if (state is MyProductLoadedState) {
        final final_state = state as MyProductLoadedState;
        return ListView.builder(
          controller: _scrollController,
          itemCount: state.products.length + 1, // Add one for loading indicator
          itemBuilder: (context, index) {
            if (index < state.products.length) {
              return ProductTileWidget(product: final_state.products[index]);
            } else {
              // Show a loading indicator only at the bottom
              return Center(child: CircularProgressIndicator());
            }
          },
        );
      }

      if (state is MyProductLoadingState) {
        return Center(child: CircularProgressIndicator());
      }

      return Center(child: CircularProgressIndicator());
    },
    ),


    );
  }
}
