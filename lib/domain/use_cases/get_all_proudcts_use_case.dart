import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/fialures.dart';
import 'package:e_commerce/domain/entities/product_response_entity.dart';
import 'package:e_commerce/domain/repositories/home/home_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllProudctsUseCase {
  HomeRepository homeRepository;
  GetAllProudctsUseCase({required this.homeRepository});

  Future<Either<Failure, ProductResponseEntity>> call() async {
    return await homeRepository.getAllProducts();
  }
}
