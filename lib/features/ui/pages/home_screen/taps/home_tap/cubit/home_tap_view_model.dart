import 'package:e_commerce/domain/entities/categories_or_brands_response_entity.dart';
import 'package:e_commerce/domain/use_cases/categories_use_case.dart';
import 'package:e_commerce/domain/use_cases/get_all_brands_use_case.dart';
import 'package:e_commerce/features/ui/pages/home_screen/taps/home_tap/cubit/home_tap_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeTapViewModel extends Cubit<HomeTapStates> {
  CategoriesUseCase categoriesUseCase;
  GetAllBrandsUseCase brandsUseCase;
  CategoriesOrBrandsResponseEntity? brandsResponseEntity;
  CategoriesOrBrandsResponseEntity? categoriesResponseEntity;
  HomeTapViewModel(this.categoriesUseCase, this.brandsUseCase)
    : super(InitialState());

  Future<void> fetchCategories() async {
    emit(CategoriesLoading());
    final result = await categoriesUseCase.call();
    result.fold(
      (failure) {
        emit(CategoriesError(failure.message));
      },
      (categoriesOrBrandsResponseEntity) {
        emit(CategoriesLoaded(categoriesOrBrandsResponseEntity));
        categoriesResponseEntity = categoriesOrBrandsResponseEntity;
      },
    );
  }

  Future<void> fetchBrands() async {
    emit(BrandsLoading());
    final result = await brandsUseCase.call();
    result.fold(
      (failure) {
        emit(BrandsError(failure.message));
      },
      (categoriesOrBrandsResponseEntity) {
        emit(BrandsLoaded(categoriesOrBrandsResponseEntity));
        brandsResponseEntity = categoriesOrBrandsResponseEntity;
      },
    );
  }
}
