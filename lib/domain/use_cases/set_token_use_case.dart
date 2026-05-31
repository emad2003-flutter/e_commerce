import 'package:e_commerce/domain/repositories/auth/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SetTokenUseCase {
  final AuthRepository repository;

  SetTokenUseCase(this.repository);

  Future<void> call(String token) async {
    await repository.setToken(token);
  }
}
