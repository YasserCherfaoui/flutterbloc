import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/core/router/app_router.dart';
import 'package:flutterbloc/core/theme/theme.dart';
import 'package:flutterbloc/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutterbloc/init_dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (_) => serviceLocator<AuthBloc>(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'FlutterBloC',
      theme: AppTheme.darkTheme,
      routerConfig: AppRouter.router,
    );
  }
}
