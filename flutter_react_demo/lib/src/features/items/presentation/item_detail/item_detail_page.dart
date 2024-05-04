import 'package:flutter/material.dart';
import 'package:flutter_react_demo/src/features/items/data/item_repository.dart';
import 'package:flutter_react_demo/src/features/items/presentation/item_detail/item_body.dart';
import 'package:flutter_react_demo/src/features/items/presentation/item_detail/item_button.dart';
import 'package:flutter_react_demo/src/features/items/presentation/item_detail/item_cover.dart';
import 'package:flutter_react_demo/src/features/items/presentation/item_detail/item_detail_controller.dart';
import 'package:flutter_react_demo/src/features/items/presentation/item_detail/item_price.dart';
import 'package:flutter_react_demo/src/features/items/presentation/item_detail/item_rating.dart';
import 'package:provider/provider.dart';

class ItemDetailPage extends StatelessWidget {
  const ItemDetailPage({required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    final repository = Provider.of<ItemRepository>(context);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text('Details'),
          actions: [
            IconButton(
              icon: Consumer<ItemDetailController>(
                  builder: (context, value, child) {
                debugPrint('${value.isCurrentFavourited(id)}');
                if(value.operationStatus == Status.InProgress){
                  return SizedBox(
                      height: 18,
                      width: 18,
                      child: CircularProgressIndicator());
                }
                if (value.isCurrentFavourited(id)) {
                  return Icon(
                    Icons.favorite,
                    color: Colors.grey[800],
                  );
                }
                return Icon(Icons.favorite_border_sharp);
              }),
              onPressed: () {
                final controller = Provider.of<ItemDetailController>(context, listen: false);
                controller.updateFavourite(id);
              },
            )
          ]),
      body: FutureBuilder(
        future: repository.fetchItem(id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // handle loading
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            // handle data
            final item = snapshot.data!;
            return SingleChildScrollView(
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
    );
  }
}
