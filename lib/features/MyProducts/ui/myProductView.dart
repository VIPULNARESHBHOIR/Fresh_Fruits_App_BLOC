// import 'package:flutter/material.dart';
// import 'api_service.dart';
// import 'product_model.dart';
//
// class PaginationScreen extends StatefulWidget {
//   @override
//   _PaginationScreenState createState() => _PaginationScreenState();
// }
//
// class _PaginationScreenState extends State<PaginationScreen> {
//   final ApiService apiService = ApiService();
//   List<Product> products = [];
//   int page = 0;
//   final int limit = 10;
//   bool isLoading = false;
//
//   @override
//   void initState() {
//     super.initState();
//     fetchMoreProducts();
//   }
//
//   Future<void> fetchMoreProducts() async {
//     if (!isLoading) {
//       setState(() => isLoading = true);
//
//       List<Product> newProducts = await apiService.fetchProducts(limit, page * limit);
//       setState(() {
//         products.addAll(newProducts);
//         page++;
//         isLoading = false;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Pagination Example")),
//       body: ListView.builder(
//         itemCount: products.length + 1,
//         itemBuilder: (context, index) {
//           if (index < products.length) {
//             return ListTile(
//               leading: Image.network(products[index].thumbnail, width: 50, height: 50),
//               title: Text(products[index].title),
//             );
//           } else {
//             fetchMoreProducts(); // Load next batch when scrolled
//             return Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
//     );
//   }
// }
