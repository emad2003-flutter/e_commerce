import 'package:e_commerce/domain/use_cases/get_all_proudcts_use_case.dart';
import 'package:e_commerce/features/ui/pages/home_screen/taps/products_tap/cubit/products_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductsViewModel extends Cubit<ProductsStates> {
  ProductsViewModel(this.getAllProudctsUseCase) : super(ProductsInitialState());
  final GetAllProudctsUseCase getAllProudctsUseCase;
  List productList = [];

  Future<void> fetchAllProducts() async {
    emit(ProductsLoadingState());
    final result = await getAllProudctsUseCase.call();
    result.fold(
      (failure) {
        emit(ProductsErrorState(failure.message));
      },
      (productResponseEntity) {
        productList = productResponseEntity.productEntity ?? [];
        emit(ProductsLoadedState(productResponseEntity));
      },
    );
  }

  void printProducts() {
    print(productList);
  }
}
