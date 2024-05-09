import 'package:flutter/material.dart';
import 'package:flutter_react_demo/src/features/items/presentation/item_detail/item_detail_page.dart';
import 'package:flutter_react_demo/src/features/items/presentation/item_list/item_list_page.dart';
import 'package:flutter_react_demo/src/routing/error_screen.dart';
import 'package:go_router/go_router.dart';

enum AppRoute { home, product, error}

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  debugLogDiagnostics: true,
  errorBuilder: (context, state) => const ErrorScreen(),
  navigatorKey: _rootNavigatorKey,
  routes: <RouteBase>[
    // top route inside branch
    GoRoute(
      path: '/',
      name: AppRoute.home.name,
      builder: (BuildContext context, GoRouterState state) =>
          ItemListPage(),
      routes: <RouteBase>[
        GoRoute(
          path: 'product/:id',
          name: AppRoute.product.name,
          pageBuilder: (context, state) {
            final productId = state.pathParameters['id']!;
            return CustomTransitionPage<void>(
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      FadeTransition(opacity: animation, child: child),
              child: ItemDetailPage(id: productId),
            );
          },
        ),
      ],
    ),
  ],
);
