import 'package:bloc_mvvm_poc_app/ui/login_page.dart';
import 'package:bloc_mvvm_poc_app/ui/myhome_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  late GoRouter router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const MyHomePage(),
    ),
    GoRoute(
      path: '/single-user-page',
      builder: (context, state) => const LoginPage(),
    ),
  ]);
}
