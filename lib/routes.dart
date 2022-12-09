import 'package:devfest_2022_flutter/screens/cart.dart';
import 'package:devfest_2022_flutter/screens/home.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/cart',
      builder: (context, state) => CartScreen(),
    ),
  ],
);
