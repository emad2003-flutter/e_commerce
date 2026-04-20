import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/api/api_manager.dart';
import 'package:e_commerce/core/api/end_points.dart';
import 'package:e_commerce/core/errors/fialures.dart';
import 'package:e_commerce/data/data_souces/remote/home_remote_data_source.dart';
import 'package:e_commerce/data/models/categories_or_brands_response_dto.dart';
import 'package:e_commerce/data/models/product_response_dto.dart';
import 'package:e_commerce/domain/entities/categories_or_brands_response_entity.dart';
import 'package:e_commerce/domain/entities/product_response_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  ApiManager apiManager;
  HomeRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<Either<Failure, CategoriesOrBrandsResponseEntity>>
  getAllBrands() async {
    try {
      final List<ConnectivityResult> connectivityResult = await Connectivity()
          .checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        var response = await apiManager.getData(
          endPoint: EndPoints.getAllBrands,
        );
        var categoriesResponse = CategoriesResponseDto.fromJson(response.data);

        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(categoriesResponse);
        } else {
          return Left(
            ServerFailure(categoriesResponse.message ?? "Server Failure"),
          );
        }
      } else {
        return Left(NetworkFailure("No Internet Connection"));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CategoriesOrBrandsResponseEntity>>
  getCategories() async {
    try {
      final List<ConnectivityResult> connectivityResult = await Connectivity()
          .checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        var response = await apiManager.getData(
          endPoint: EndPoints.getAllCategories,
        );
        var categoriesResponse = CategoriesResponseDto.fromJson(response.data);

        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(categoriesResponse);
        } else {
          return Left(
            ServerFailure(categoriesResponse.message ?? "Server Failure"),
          );
        }
      } else {
        return Left(NetworkFailure("No Internet Connection"));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProductResponseEntity>> getAllProducts() async {
    try {
      final List<ConnectivityResult> connectivityResult = await Connectivity()
          .checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        var response = await apiManager.getData(
          endPoint: EndPoints.getAllProducts,
        );
        var productResponse = ProductResponseDm.fromJson(response.data);

        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          print(productResponse);
          return Right(productResponse);
        } else {
          return Left(
            ServerFailure(productResponse.message ?? "Server Failure"),
          );
        }
      } else {
        return Left(NetworkFailure("No Internet Connection"));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
