// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/data_souces/remote/auth_remote_data_source.dart' as _i97;
import '../../data/data_souces/remote/home_remote_data_source.dart' as _i567;
import '../../data/data_souces/remote/impl/auth_remote_data_source_impl.dart'
    as _i84;
import '../../data/data_souces/remote/impl/home_remote_data_source_impl.dart'
    as _i1051;
import '../../data/repositories/auth/auth_repository_impl.dart' as _i24;
import '../../data/repositories/home/home_repository_impl.dart' as _i161;
import '../../domain/repositories/auth/auth_repository.dart' as _i660;
import '../../domain/repositories/home/home_repository.dart' as _i22;
import '../../domain/use_cases/categories_use_case.dart' as _i1057;
import '../../domain/use_cases/get_all_brands_use_case.dart' as _i773;
import '../../domain/use_cases/get_all_proudcts_use_case.dart' as _i354;
import '../../domain/use_cases/login_use_case.dart' as _i471;
import '../../domain/use_cases/register_use_case.dart' as _i479;
import '../../features/ui/auth/login/cubit/login_view_model.dart' as _i245;
import '../../features/ui/auth/register/cubit/register_view_model.dart'
    as _i873;
import '../../features/ui/pages/home_screen/cubit/home_view_model.dart'
    as _i866;
import '../../features/ui/pages/home_screen/taps/home_tap/cubit/home_tap_view_model.dart'
    as _i615;
import '../../features/ui/pages/home_screen/taps/products_tap/cubit/products_view_model.dart'
    as _i703;
import '../api/api_manager.dart' as _i1047;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i1047.ApiManager>(() => _i1047.ApiManager());
    gh.factory<_i97.AuthRemoteDataSource>(
      () => _i84.AuthRemoteDataSourceImpl(apiManager: gh<_i1047.ApiManager>()),
    );
    gh.factory<_i567.HomeRemoteDataSource>(
      () =>
          _i1051.HomeRemoteDataSourceImpl(apiManager: gh<_i1047.ApiManager>()),
    );
    gh.factory<_i660.AuthRepository>(
      () => _i24.AuthRepositoryImpl(
        remoteDataSource: gh<_i97.AuthRemoteDataSource>(),
      ),
    );
    gh.factory<_i471.LoginUseCase>(
      () => _i471.LoginUseCase(authRepository: gh<_i660.AuthRepository>()),
    );
    gh.factory<_i479.RegisterUseCase>(
      () => _i479.RegisterUseCase(authRepository: gh<_i660.AuthRepository>()),
    );
    gh.factory<_i22.HomeRepository>(
      () => _i161.HomeRepositoryImpl(
        homeRemoteDataSource: gh<_i567.HomeRemoteDataSource>(),
      ),
    );
    gh.factory<_i873.RegisterViewModel>(
      () =>
          _i873.RegisterViewModel(registerUseCase: gh<_i479.RegisterUseCase>()),
    );
    gh.factory<_i1057.CategoriesUseCase>(
      () => _i1057.CategoriesUseCase(homeRepository: gh<_i22.HomeRepository>()),
    );
    gh.factory<_i773.GetAllBrandsUseCase>(
      () =>
          _i773.GetAllBrandsUseCase(homeRepository: gh<_i22.HomeRepository>()),
    );
    gh.factory<_i354.GetAllProudctsUseCase>(
      () => _i354.GetAllProudctsUseCase(
        homeRepository: gh<_i22.HomeRepository>(),
      ),
    );
    gh.factory<_i703.ProductsViewModel>(
      () => _i703.ProductsViewModel(gh<_i354.GetAllProudctsUseCase>()),
    );
    gh.factory<_i866.HomeViewModel>(
      () => _i866.HomeViewModel(gh<_i1057.CategoriesUseCase>()),
    );
    gh.factory<_i245.LoginViewModel>(
      () => _i245.LoginViewModel(loginUseCase: gh<_i471.LoginUseCase>()),
    );
    gh.factory<_i615.HomeTapViewModel>(
      () => _i615.HomeTapViewModel(
        gh<_i1057.CategoriesUseCase>(),
        gh<_i773.GetAllBrandsUseCase>(),
      ),
    );
    return this;
  }
}
