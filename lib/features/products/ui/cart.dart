import 'package:flutter/material.dart';

class CartItems extends StatefulWidget {
  const CartItems({super.key});

  @override
  State<CartItems> createState() => _CartItemsState();
}

class _CartItemsState extends State<CartItems> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Items'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Text('Cart Items List'),
      ),
    );
  }
}
