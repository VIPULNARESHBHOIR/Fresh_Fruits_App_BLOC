import 'package:flutter/material.dart';
import 'package:grocery/features/Trial/model.dart';
import 'package:grocery/features/Trial/service.dart';


class PaginationScreen extends StatefulWidget {
  @override
  _PaginationScreenState createState() => _PaginationScreenState();
}

class _PaginationScreenState extends State<PaginationScreen> {
  final ApiService apiService = ApiService();
  List<Product> products = [];
  int page = 0;
  final int limit = 20;
  bool isLoading = false;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_scrollListener);
    fetchMoreProducts();
  }

  @override
  void dispose() {
    _scrollController.dispose(); // Clean up controller
    super.dispose();
  }

  void _scrollListener() {
    print("Scrolled to: ${_scrollController.position.pixels}");
    print("Max Scroll Extent: ${_scrollController.position.maxScrollExtent}");

    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200 &&
        !isLoading) {
      fetchMoreProducts();
    }
  }


  Future<void> fetchMoreProducts() async {
    if (!isLoading) {
      setState(() => isLoading = true);

      List<Product> newProducts = await apiService.fetchProducts(limit, page * limit);
      setState(() {
        products.addAll(newProducts);
        page++;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pagination Example")),
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
  }
}
