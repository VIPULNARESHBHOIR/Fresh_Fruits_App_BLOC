import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/features/MyProducts/bloc/my_product_bloc.dart';
import '../../../Data/myproducts.dart';

class PaginationScreen extends StatefulWidget {
  @override
  _PaginationScreenState createState() => _PaginationScreenState();
}

class _PaginationScreenState extends State<PaginationScreen> {
  final MyProductBloc myProductBloc = MyProductBloc();

  // final ApiService apiService = ApiService();
  int page = 0;
  final int limit = 16;
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
      appBar: AppBar(title: Text("MyProducts")),
      body: BlocBuilder<MyProductBloc, MyProductState>(
        bloc: myProductBloc,
        buildWhen: (previous, current) => current is MyProductState,

        builder: (context, state) {
          switch(state.runtimeType){
            case MyProductLoadingState:
              return Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ));

            case MyProductLoadedState:
              return Scaffold(
                // appBar: AppBar(title: Text("MyProducts")),
                body: ListView.builder(
                  controller: _scrollController, // Attach the scroll controller
                  itemCount: products.length + (isLoading ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index < products.length) {
                      return ListTile(
                        leading: Image.network(products[index].thumbnail, width: 50, height: 50),
                        title: Text(products[index].title),
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              );

            case LoadingFailed:
              return Container();

            default:
              return Container();
          }

        },
      ),
    );
  }
}
