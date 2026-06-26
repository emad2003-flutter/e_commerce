import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/fialures.dart';
import 'package:e_commerce/domain/entities/add_to_card_response_entity.dart';
import 'package:e_commerce/domain/repositories/home/home_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddOrderToCardUseCase {
  HomeRepository homeRepository;
  AddOrderToCardUseCase({required this.homeRepository});
  Future<Either<Failure, AddToCardResponseEntity>> call(String productId) {
    return homeRepository.addProductToCart(productId);
  }
}
