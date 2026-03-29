import 'package:flutter/material.dart';

class ProductsTap extends StatelessWidget {
  const ProductsTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 0.75,
        ),
        children: [
          ProductTabItem(),
          ProductTabItem(),
          ProductTabItem(),
          ProductTabItem(),
          ProductTabItem(),
          ProductTabItem(),
        ],
      ),
    );
  }
}
