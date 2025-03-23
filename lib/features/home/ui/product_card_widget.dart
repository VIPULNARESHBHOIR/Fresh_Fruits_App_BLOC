import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_bloc_tutorial/features/home/bloc/home_bloc.dart';
// import 'package:flutter_bloc_tutorial/features/home/models/home_product_data_model.dart';

import '../bloc/home_bloc.dart';
import '../models/data_models.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final HomeBloc homeBloc;
  const ProductTileWidget(
      {super.key, required this.productDataModel, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      padding: const EdgeInsets.all(12),

      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFE6FF00), width: 1),
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [Color(0xE5BBFF92), Color(0xDBE1FF71)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            spreadRadius: 2,
            offset: Offset(2, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              height: 190,
              width: double.infinity,

              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(productDataModel.imageurl),
                ),
              ),
            ),
          ),
          const SizedBox(height: 14),
          Text(
            productDataModel.name,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              fontFamily: 'Raleway', // Stylish Font
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            productDataModel.description,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.4,
              fontFamily: 'Lato',
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$${productDataModel.price.toStringAsFixed(2)}",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Raleway',
                  color: Colors.green.shade700,
                ),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      homeBloc.add(HomeProductWishlistButtonClickedEvent(
                          product: productDataModel));
                    },
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.pink.shade50,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.pink.withOpacity(0.3),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: Icon(Icons.favorite_border, color: Colors.pink),
                    ),
                  ),
                  const SizedBox(width: 12),
                  InkWell(
                    onTap: () {
                      homeBloc.add(HomeProductCartButtonClickedEvent(
                          product: productDataModel));
                    },
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.withOpacity(0.3),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: Icon(Icons.shopping_basket_outlined, color: Colors.blue),
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
