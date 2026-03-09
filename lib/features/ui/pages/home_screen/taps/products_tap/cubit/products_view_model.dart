import 'package:e_commerce/features/ui/pages/home_screen/taps/products_tap/cubit/products_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsViewModel extends Cubit<ProductsStates> {
  ProductsViewModel() : super(ProductsInitialState());
}
