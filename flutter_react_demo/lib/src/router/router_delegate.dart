import 'package:flutter/material.dart';
import 'package:flutter_react_demo/src/features/items/presentation/item_detail/item_detail_page.dart';
import 'package:flutter_react_demo/src/features/items/presentation/item_list/item_list_page.dart';
import 'package:flutter_react_demo/src/router/route.dart';

class AppRouterDelegate extends RouterDelegate<AppRoute>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRoute> {
  final GlobalKey<NavigatorState> navigatorKey;

  String? _selectedId;

  AppRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  AppRoute get currentConfiguration => _selectedId == null
      ? AppRoute.home()
      : AppRoute.details(_selectedId);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          key: ValueKey('ItemListPage'),
          child: ItemListPage(
            onTapped: _handleBookTapped,
          ),
        ),
        if (_selectedId != null) ItemDetailScreen(id: _selectedId!)
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        // Update the list of pages by setting _selectedBook to null
        _selectedId = null;
        notifyListeners();

        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(AppRoute path) async {
    if (path.isDetailsPage) {
      _selectedId = path.id;
    }
  }

  void _handleBookTapped(String id) {
    _selectedId = id;
    notifyListeners();
  }
}