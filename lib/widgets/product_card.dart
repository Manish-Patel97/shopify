import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final String imageUrl;
  final Color backgroundColor;
  const ProductCard({super.key,
  required this.title,
  required this.price,
  required this.imageUrl, 
  required this.backgroundColor
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      padding: const EdgeInsets.all(10),
      
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color:backgroundColor,
            blurRadius: 0.5,
            spreadRadius: 0.5,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
          style: Theme.of(context).textTheme.titleSmall
          ),
          const SizedBox(height: 5),
          Text("₹ $price",
          style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 5),
          Center(
            child: Image(image: AssetImage(imageUrl),
            height: MediaQuery.of(context).size.height * 0.14,
            ),
          ),
        ],
      ),
    );
  }
}