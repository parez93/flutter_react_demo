import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_react_demo/src/constants/test_item.dart';
import 'package:flutter_react_demo/src/features/items/data/fake_item_repository.dart';
import 'package:flutter_react_demo/src/features/items/data/item_repository.dart';
import 'package:flutter_react_demo/src/features/items/domain/item.dart';
import 'package:flutter_react_demo/src/features/items/presentation/item_detail/item_detail_controller.dart';
import 'package:provider/provider.dart';

import 'features/items/presentation/item_list/item_list_page.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ItemRepository>(
          create: (context) => FakeItemRepository(),
        ),
        ChangeNotifierProvider(
          create: (_) => ItemDetailController(repository: FakeItemRepository()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        onGenerateTitle: (BuildContext context) =>
            AppLocalizations.of(context)!.appTitle,
        theme: ThemeData(),
        // darkTheme: ThemeData.dark(),
        home: ItemListPage(),
      ),

      // home: ItemDetailPage(),
    );
  }
}
