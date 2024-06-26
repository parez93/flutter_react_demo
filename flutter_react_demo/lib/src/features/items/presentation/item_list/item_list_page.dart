import 'package:flutter/material.dart';
import 'package:flutter_react_demo/src/constants/test_item.dart';
import 'package:flutter_react_demo/src/features/items/presentation/item_detail/item_detail_page.dart';
import 'package:flutter_react_demo/src/features/items/presentation/item_list/item_tile.dart';

class ItemListPage extends StatelessWidget {
  ItemListPage({super.key});

  void goDetailPage(BuildContext context, String id) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => ItemDetailPage(id: id)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(backgroundColor: Colors.orange, title: Text('Demo Flutter')),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: ItemTile(item: items[index], onTap: () => goDetailPage(context, items[index].id),),
          ),
        ),
      ),
    );
  }
}
