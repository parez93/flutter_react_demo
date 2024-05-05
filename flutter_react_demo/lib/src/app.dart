import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_react_demo/src/router/route_info_parser.dart';
import 'package:flutter_react_demo/src/router/router_delegate.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context)!.appTitle,
      theme: ThemeData(),
      // darkTheme: ThemeData.dark(),
      routeInformationParser: AppRouteInformationParser(),
      routerDelegate: AppRouterDelegate(),

    );
  }
}
