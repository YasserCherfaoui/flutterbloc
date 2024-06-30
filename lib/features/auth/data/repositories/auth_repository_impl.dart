import 'package:flutterbloc/core/error/exceptions.dart';
import 'package:flutterbloc/core/error/failures.dart';
import 'package:flutterbloc/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:flutterbloc/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authDataSource;
  AuthRepositoryImpl(this.authDataSource);

  @override
  Future<Either<Failure, String>> login(
      {required String email, required String password}) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> register({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      final String uid = await authDataSource.register(
          username: username, email: email, password: password);
      return Right(uid);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }
}
