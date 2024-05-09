import 'package:flutter/material.dart';
import 'package:flutter_react_demo/src/constants/test_item.dart';
import 'package:flutter_react_demo/src/features/items/presentation/item_list/item_tile.dart';
import 'package:flutter_react_demo/src/routing/app_router.dart';
import 'package:go_router/go_router.dart';

class ItemListPage extends StatelessWidget {
  ItemListPage({super.key});

  void goDetailPage(BuildContext context, String id) {
    // Navigator.of(context).push(
    //     MaterialPageRoute(builder: (context) => ItemDetailPage(id: id)));
    context.goNamed(AppRoute.product.name, pathParameters: {'id': id});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar:
          AppBar(backgroundColor: Colors.orange, title: Text('Demo Flutter')),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: ItemTile(
              item: items[index],
              onTap: () => goDetailPage(context, items[index].id),
            ),
          ),
        ),
      ),
    );
  }
}
