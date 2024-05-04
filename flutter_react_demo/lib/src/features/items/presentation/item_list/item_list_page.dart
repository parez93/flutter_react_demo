import 'package:flutter/material.dart';
import 'package:flutter_react_demo/src/features/items/data/item_repository.dart';
import 'package:flutter_react_demo/src/features/items/presentation/item_detail/item_detail_page.dart';
import 'package:flutter_react_demo/src/features/items/presentation/item_list/item_tile.dart';
import 'package:provider/provider.dart';

class ItemListPage extends StatelessWidget {
  ItemListPage({super.key});

  final items = List.generate(10, (index) => index);

  void goDetailPage(BuildContext context, String id) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => ItemDetailPage(id: id)));
  }

  @override
  Widget build(BuildContext context) {
    final repository = Provider.of<ItemRepository>(context);
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar:
          AppBar(backgroundColor: Colors.orange, title: Text('Demo Flutter')),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: FutureBuilder(
          future: repository.fetchItemList(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // handle loading
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              // handle data
              final item = snapshot.data!;
              return ListView.builder(
                itemCount: item.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ItemTile(
                    item: item[index],
                    onTap: () => goDetailPage(context, item[index].id),
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              // handle error (note: snapshot.error has type [Object?])
              final error = snapshot.error!;
              return Text(error.toString());
            } else {
              return Text('Some error occurred!');
            }
          },
        ),
      ),
    );
  }
}
