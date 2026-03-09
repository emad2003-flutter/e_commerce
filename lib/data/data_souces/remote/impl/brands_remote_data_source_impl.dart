import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/api/api_manager.dart';
import 'package:e_commerce/core/api/end_points.dart';
import 'package:e_commerce/core/errors/fialures.dart';
import 'package:e_commerce/data/data_souces/remote/brands_remote_data_source.dart';
import 'package:e_commerce/data/models/categories_or_brands_response_dto.dart';
import 'package:e_commerce/domain/entities/categories_or_brands_response_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BrandsRemoteDataSource)
class BrandsRemoteDataSourceImpl implements BrandsRemoteDataSource {
  BrandsRemoteDataSourceImpl({required this.apiManager});
  ApiManager apiManager;
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
}
