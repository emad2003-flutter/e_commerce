import 'package:e_commerce/domain/repositories/auth/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetTokenUseCase {
  final AuthRepository authRepository;

  GetTokenUseCase({required this.authRepository});

  Future<String> call() {
    return authRepository.getToken();
  }
}
