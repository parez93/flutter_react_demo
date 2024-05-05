import 'package:flutter/cupertino.dart';
import 'package:flutter_react_demo/src/router/route.dart';

class AppRouteInformationParser extends RouteInformationParser<AppRoute> {
  @override
  Future<AppRoute> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location);

    if (uri.pathSegments.length >= 2) {
      var remaining = uri.pathSegments[1];
      return AppRoute.details(remaining);
    } else {
      return AppRoute.home();
    }
  }

  @override
  RouteInformation? restoreRouteInformation(AppRoute path) {
    if (path.isHomePage) {
      return RouteInformation(uri: Uri.tryParse('/'));
    }
    if (path.isDetailsPage) {
      return RouteInformation(uri: Uri.tryParse('/item/${path.id}'));
    }
    return null;
  }
}