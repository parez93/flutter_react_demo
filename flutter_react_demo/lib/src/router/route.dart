class AppRoute {
  final String? id;

  AppRoute.home() : id = null;

  AppRoute.details(this.id);

  bool get isHomePage => id == null;

  bool get isDetailsPage => id != null;
}
