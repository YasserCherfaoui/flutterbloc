import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/core/error/failures.dart';
import 'package:flutterbloc/features/auth/domain/usecases/user_sign_up.dart';
import 'package:fpdart/fpdart.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;

  AuthBloc({required UserSignUp userSignUp})
      : _userSignUp = userSignUp,
        super(AuthInitial()) {
    on<AuthSignUp>((event, emit) async {
      final Either<Failure, String> res = await _userSignUp(
        UserSignUpParams(
          username: event.name,
          email: event.email,
          password: event.password,
        ),
      );
      emit(AuthLoading());
      res.fold(
        (failure) => emit(AuthFailure(failure.message)),
        (success) => emit(
          AuthSuccess(
            success
          ),
        ),
      );
    });
  }
}
