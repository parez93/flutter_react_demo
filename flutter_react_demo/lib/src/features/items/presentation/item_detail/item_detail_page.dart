import 'package:flutter/material.dart';
import 'package:flutter_react_demo/src/common_widgets/async_value_widget.dart';
import 'package:flutter_react_demo/src/features/items/data/fake_item_repository.dart';
import 'package:flutter_react_demo/src/features/items/presentation/item_detail/item_body.dart';
import 'package:flutter_react_demo/src/features/items/presentation/item_detail/item_button.dart';
import 'package:flutter_react_demo/src/features/items/presentation/item_detail/item_cover.dart';
import 'package:flutter_react_demo/src/features/items/presentation/item_detail/item_detail_controller.dart';
import 'package:flutter_react_demo/src/features/items/presentation/item_detail/item_price.dart';
import 'package:flutter_react_demo/src/features/items/presentation/item_detail/item_rating.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ItemDetailPage extends ConsumerWidget {
  const ItemDetailPage({required this.id});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemAsync = ref.watch(futureItemProvider(id));
    final favouriteAsync = ref.watch(itemDetailControllerProvider);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text('Details'),
          actions: [
            IconButton(
              icon: AsyncValueWidget(
                  value: favouriteAsync,
                  loading: SizedBox(
                      height: 18,
                      width: 18,
                      child: CircularProgressIndicator()),
                  data: (favourite) {
                    if (favourite.containsKey(id) && favourite[id] == true) {
                      return Icon(Icons.favorite, color: Colors.grey[800]);
                    }
                    return Icon(Icons.favorite_border_sharp);
                  }),
              onPressed: () {
                ref
                    .read(itemDetailControllerProvider.notifier)
                    .updateFavourite(id);
              },
            )
          ]),
      body: AsyncValueWidget(
        value: itemAsync,
        data: (item) => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Center(
                  child: ItemCover(imageUrl: item.imageUrl),
                ),
                SizedBox(height: 30),
                ItemRating(),
                SizedBox(height: 8),
                ItemBody(title: item.title, description: item.description),
                SizedBox(height: 18),
                Row(
                  children: [
                    ItemPrice(price: item.price),
                    Spacer(),
                    ItemButton()
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
