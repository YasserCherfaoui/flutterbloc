import 'package:flutterbloc/core/error/failures.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, String>> login(
      {required String email, required String password});
  Future<Either<Failure, String>> register(
      {required String username,
      required String email,
      required String password});
  Future<Either<Failure, String>> logout();
}
