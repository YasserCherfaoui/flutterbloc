import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterbloc/core/router/app_router.dart';
import 'package:flutterbloc/core/theme/theme.dart';
import 'package:flutterbloc/firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
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
