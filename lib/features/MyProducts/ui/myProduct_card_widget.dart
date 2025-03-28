import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:grocery/features/MyProducts/data_models/ProductDataModel.dart';

class ProductTileWidget extends StatefulWidget {
  final Product product;

  const ProductTileWidget(
      {super.key, required this.product});

  @override
  State<ProductTileWidget> createState() => _ProductTileWidgetState();
}

class _ProductTileWidgetState extends State<ProductTileWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      padding: const EdgeInsets.all(12),

      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF16F6FF), width: 1),
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [Color(0xF0C989FF), Color(0xDB71D5FF)],
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
                  image: NetworkImage(widget.product.thumbnail),
                ),
              ),
            ),
          ),
          const SizedBox(height: 14),
          Text(
            widget.product.title,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              fontFamily: 'Raleway', // Stylish Font
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            widget.product.description,
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
                "\$${widget.product.price.toStringAsFixed(2)}",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Raleway',
                  color:  Color(0xDB001720),
                ),
              ),

            ],
          ),
        ],
      ),
    );

  }
}
