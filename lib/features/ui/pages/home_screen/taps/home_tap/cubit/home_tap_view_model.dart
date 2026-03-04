import 'package:e_commerce/domain/entities/categories_response_entity.dart';
import 'package:e_commerce/domain/use_cases/categories_use_case.dart';
import 'package:e_commerce/features/ui/pages/home_screen/taps/home_tap/cubit/home_tap_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeTapViewModel extends Cubit<HomeTapStates> {
  CategoriesUseCase categoriesUseCase;
  HomeTapViewModel(this.categoriesUseCase) : super(InitialState());

  Future<void> fetchCategories() async {
    emit(CategoriesLoading());
    final result = await categoriesUseCase.call();
    result.fold(
      (failure) {
        emit(CategoriesError(failure.message));
      },
      (categoriesResponseEntity) {
        emit(CategoriesLoaded(categoriesResponseEntity));
      },
    );
  }
}
