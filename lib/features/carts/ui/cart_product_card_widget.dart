import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../home/models/data_models.dart';
import '../bloc/cart_bloc.dart';

class CartTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final CartBloc cartBloc;
  const CartTileWidget(
      {super.key, required this.productDataModel, required this.cartBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade400, width: 1),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: 200,
              width: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(productDataModel.imageurl),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            productDataModel.name,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            productDataModel.description,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$${productDataModel.price.toStringAsFixed(2)}",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade700,
                ),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      // Add to favorites logic
                    },
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.red.shade50,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.favorite_border, color: Colors.red),
                    ),
                  ),
                  const SizedBox(width: 12),
                  InkWell(
                    onTap: () {
                      cartBloc.add(CartRemoveButtonClickedEvent(
                          remove_product: productDataModel));
                    },
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.shopping_basket, color: Colors.blue),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );

  }
}
