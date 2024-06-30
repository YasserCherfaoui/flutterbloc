import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutterbloc/core/keys/app_secrets.dart';
import 'package:flutterbloc/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:flutterbloc/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:flutterbloc/features/auth/domain/repository/auth_repository.dart';
import 'package:flutterbloc/features/auth/domain/usecases/user_sign_up.dart';
import 'package:flutterbloc/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutterbloc/firebase_options.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final supabase = await Supabase.initialize(
      url: AppSecrets.supabaseUrl, anonKey: AppSecrets.supabaseAnonKey);

  serviceLocator.registerLazySingleton<FirebaseAuth>(
    () => FirebaseAuth.instance,
  );
  serviceLocator.registerLazySingleton<SupabaseClient>(() => supabase.client);
}

void _initAuth() {
  serviceLocator.registerFactory<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      firebaseAuth: serviceLocator(),
    ),
    instanceName: "firebase",
  );

  serviceLocator.registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceSupabase(
            supabaseClient: serviceLocator(),
          ),
      instanceName: "supabase");
  serviceLocator.registerFactory<AuthRepository>(
    () => AuthRepositoryImpl(
      serviceLocator(instanceName: "supabase"),
    ),
  );
  serviceLocator.registerFactory(
    () => UserSignUp(
      authRepository: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => AuthBloc(
      userSignUp: serviceLocator(),
    ),
  );
}
