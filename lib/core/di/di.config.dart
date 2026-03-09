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
import '../../data/data_souces/remote/brands_remote_data_source.dart' as _i206;
import '../../data/data_souces/remote/categories_remote_data_source.dart'
    as _i1000;
import '../../data/data_souces/remote/impl/auth_remote_data_source_impl.dart'
    as _i84;
import '../../data/data_souces/remote/impl/brands_remote_data_source_impl.dart'
    as _i883;
import '../../data/data_souces/remote/impl/categories_remote_data_source_impl.dart'
    as _i701;
import '../../data/repositories/auth/auth_repository_impl.dart' as _i24;
import '../../data/repositories/categories_or_brands/brands_repository_impl.dart'
    as _i442;
import '../../data/repositories/categories_or_brands/categories_repository_impl.dart'
    as _i970;
import '../../domain/repositories/auth/auth_repository.dart' as _i660;
import '../../domain/repositories/categories_and_brands/brands_repository.dart'
    as _i897;
import '../../domain/repositories/categories_and_brands/categories_repository.dart'
    as _i1000;
import '../../domain/use_cases/categories_use_case.dart' as _i1057;
import '../../domain/use_cases/get_all_brands_use_case.dart' as _i773;
import '../../domain/use_cases/login_use_case.dart' as _i471;
import '../../domain/use_cases/register_use_case.dart' as _i479;
import '../../features/ui/auth/login/cubit/login_view_model.dart' as _i245;
import '../../features/ui/auth/register/cubit/register_view_model.dart'
    as _i873;
import '../../features/ui/pages/home_screen/cubit/home_view_model.dart'
    as _i866;
import '../../features/ui/pages/home_screen/taps/home_tap/cubit/home_tap_view_model.dart'
    as _i615;
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
    gh.factory<_i1000.CategoriesRemoteDataSource>(
      () => _i701.CategoriesRemoteDataSourceImpl(
        apiManager: gh<_i1047.ApiManager>(),
      ),
    );
    gh.factory<_i206.BrandsRemoteDataSource>(
      () =>
          _i883.BrandsRemoteDataSourceImpl(apiManager: gh<_i1047.ApiManager>()),
    );
    gh.factory<_i1000.CategoriesRepository>(
      () => _i970.CategoriesRepositoryImpl(
        categoriesRemoteDataSource: gh<_i1000.CategoriesRemoteDataSource>(),
      ),
    );
    gh.factory<_i660.AuthRepository>(
      () => _i24.AuthRepositoryImpl(
        remoteDataSource: gh<_i97.AuthRemoteDataSource>(),
      ),
    );
    gh.factory<_i897.BrandsRepository>(
      () => _i442.BrandsRepositoryImpl(
        brandsRemoteDataSource: gh<_i206.BrandsRemoteDataSource>(),
      ),
    );
    gh.factory<_i1057.CategoriesUseCase>(
      () => _i1057.CategoriesUseCase(
        categoriesRepository: gh<_i1000.CategoriesRepository>(),
      ),
    );
    gh.factory<_i471.LoginUseCase>(
      () => _i471.LoginUseCase(authRepository: gh<_i660.AuthRepository>()),
    );
    gh.factory<_i479.RegisterUseCase>(
      () => _i479.RegisterUseCase(authRepository: gh<_i660.AuthRepository>()),
    );
    gh.factory<_i873.RegisterViewModel>(
      () =>
          _i873.RegisterViewModel(registerUseCase: gh<_i479.RegisterUseCase>()),
    );
    gh.factory<_i773.GetAllBrandsUseCase>(
      () => _i773.GetAllBrandsUseCase(gh<_i897.BrandsRepository>()),
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
