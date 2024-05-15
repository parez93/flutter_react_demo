import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_react_demo/src/store/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'features/items/presentation/item_list/item_list_page.dart';
import 'store/store.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
        store: store,
        child: MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context)!.appTitle,
      theme: ThemeData(),
      // darkTheme: ThemeData.dark(),
      home: ItemListPage(),
      // home: ItemDetailPage(),
    ));
  }
}
