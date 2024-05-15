import 'package:flutter/material.dart';
import 'package:flutter_react_demo/src/features/items/presentation/item_detail/item_detail_page.dart';
import 'package:flutter_react_demo/src/features/items/presentation/item_list/item_tile.dart';
import 'package:flutter_react_demo/src/store/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'redux/item_list_action.dart';

class ItemListPage extends StatelessWidget {
  ItemListPage({super.key});

  void goDetailPage(BuildContext context, String id) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ItemDetailPage(id: id)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar:
          AppBar(backgroundColor: Colors.orange, title: Text('Demo Flutter')),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: StoreConnector<AppState, AppState>(
          converter: (store) => store.state,
          onInit: (store) => store.dispatch(fetchItems),
          builder: (_, state) {
            return ListView.builder(
              itemCount: state.items.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: ItemTile(
                  item: state.items[index],
                  onTap: () => goDetailPage(context, state.items[index].id),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
