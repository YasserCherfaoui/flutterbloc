import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterbloc/core/error/exceptions.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

abstract interface class AuthRemoteDataSource {
  Future<String> login({required String email, required String password});
  Future<String> register(
      {required String username,
      required String email,
      required String password});
  Future<String> logout();
}

class AuthRemoteDataSourceSupabase implements AuthRemoteDataSource {
  final supabase.SupabaseClient supabaseClient;

  AuthRemoteDataSourceSupabase({required this.supabaseClient});
  @override
  Future<String> login({required String email, required String password}) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<String> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<String> register({required String username, required String email, required String password}) async {
    try {
      final response = await supabaseClient.auth.signUp(email: email, password: password, data: {
        "username": username
      });
      if (response.user == null){
        throw const supabase.AuthException("User is null!");
      }
      return response.user!.id;
    } on supabase.AuthException catch(e) {
      throw ServerException(e.message);
    }
  }
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth;

  AuthRemoteDataSourceImpl({required FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth;

  @override
  Future<String> login({
    required String email,
    required String password,
  }) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<String> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<String> register({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      UserCredential? userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      if (user != null) {
        await user.updateDisplayName(username);
        return user.uid;
      }else {
        throw ServerException("User is null.");
      }
      
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
