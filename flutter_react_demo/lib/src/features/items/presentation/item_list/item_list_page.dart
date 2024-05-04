import 'package:flutter/material.dart';
import 'package:flutter_react_demo/src/common_widgets/async_value_widget.dart';
import 'package:flutter_react_demo/src/features/items/data/fake_item_repository.dart';
import 'package:flutter_react_demo/src/features/items/presentation/item_detail/item_detail_page.dart';
import 'package:flutter_react_demo/src/features/items/presentation/item_list/item_tile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ItemListPage extends ConsumerWidget {
  ItemListPage({super.key});

  void goDetailPage(BuildContext context, String id) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => ItemDetailPage(id: id)));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemsAsync = ref.watch(futureItemListProvider);
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(backgroundColor: Colors.orange, title: Text('Demo Flutter')),
      body: AsyncValueWidget(
        value: itemsAsync,
        data: (items) => Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: ItemTile(item: items[index], onTap: () => goDetailPage(context, items[index].id),),
            ),
          ),
        ),
      ),
    );
  }
}
