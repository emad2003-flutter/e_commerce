abstract class Failure {
  String message;
  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);
} 

class NetworkFailure extends Failure {
  NetworkFailure(super.message);
}