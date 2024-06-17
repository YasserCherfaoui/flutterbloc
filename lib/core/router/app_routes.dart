
import 'package:flutterbloc/features/auth/presentation/pages/signin_page.dart';
import 'package:flutterbloc/features/auth/presentation/pages/signup_page.dart';
import 'package:go_router/go_router.dart';

List<GoRoute> routes = [
  GoRoute(
    name: 'login',
    path: '/',
    builder: (context, state) => const SigninPage(),
  ),
  GoRoute(
    name: 'register',
    path: '/register',
    builder: (context, state) => const SignupPage(),
  ),
];
