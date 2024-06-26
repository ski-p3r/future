import 'package:future/screens/register_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:future/screens/onboarding_screen.dart';
import 'package:future/main.dart';

final GoRouter router = GoRouter(
  initialLocation: '/register',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const OnBoarding(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const MyHomePage(title: 'Home Page'),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const Register(),
    ),
  ],
);
