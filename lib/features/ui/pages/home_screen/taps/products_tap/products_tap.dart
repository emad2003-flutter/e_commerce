import 'package:e_commerce/core/di/di.dart';
import 'package:e_commerce/features/ui/pages/home_screen/taps/products_tap/cubit/products_states.dart';
import 'package:e_commerce/features/ui/pages/home_screen/taps/products_tap/cubit/products_view_model.dart';
import 'package:e_commerce/features/ui/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsTap extends StatelessWidget {
  ProductsViewModel viewModel = getIt<ProductsViewModel>();
  ProductsTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductsViewModel, ProductsStates>(
        bloc: viewModel..fetchAllProducts(),
        builder: (context, state) {
          if (state is ProductsLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductsLoadedState) {
            final products = state.productResponseEntity.productEntity ?? [];
            return GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.75,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductTabItem(product: products[index]);
              },
            );
          } else if (state is ProductsErrorState) {
            return Center(child: Text(state.message));
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
