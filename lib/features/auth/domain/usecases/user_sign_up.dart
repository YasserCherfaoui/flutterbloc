import 'package:flutterbloc/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

import 'package:flutterbloc/core/error/failures.dart';
import 'package:flutterbloc/core/usecase/usecase.dart';

class UserSignUp implements UseCase<String, UserSignUpParams> {
  final AuthRepository authRepository;
  UserSignUp({required this.authRepository});

  @override
  Future<Either<Failure, String>> call(UserSignUpParams params) async {
    return await authRepository.register(
      username: params.username,
      email: params.email,
      password: params.password,
    );
  }
}

class UserSignUpParams {
  final String username;
  final String email;
  final String password;
  UserSignUpParams({
    required this.username,
    required this.email,
    required this.password,
  });
}
