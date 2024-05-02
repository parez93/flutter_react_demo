import 'package:flutter/material.dart';
import 'package:flutter_react_demo/src/features/items/presentation/item_list/item_tile.dart';

class ItemListPage extends StatelessWidget {
  ItemListPage({super.key});

  final items = List.generate(10, (index) => index);

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
            child: ItemTile(),
          ),
        ),
      ),
    );
  }
}
