import 'package:flutter/material.dart';
import 'package:flutter_react_demo/src/constants/test_item.dart';
import 'package:flutter_react_demo/src/features/items/presentation/item_detail/item_body.dart';
import 'package:flutter_react_demo/src/features/items/presentation/item_detail/item_button.dart';
import 'package:flutter_react_demo/src/features/items/presentation/item_detail/item_cover.dart';
import 'package:flutter_react_demo/src/features/items/presentation/item_detail/item_price.dart';
import 'package:flutter_react_demo/src/features/items/presentation/item_detail/item_rating.dart';

class ItemDetailScreen extends Page {
  final String id;

  ItemDetailScreen({
    required this.id,
  }) : super(key: ValueKey(id));

  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return ItemDetailPage(id: id);
      },
    );
  }
}


class ItemDetailPage extends StatelessWidget {
  const ItemDetailPage({required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    final item = items.firstWhere((element) => element.id == id);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text('Details'),
          actions: [
            IconButton(
              icon: Icon(Icons.favorite_border_sharp),
              onPressed: () {},
            )
          ]),
      body: SingleChildScrollView(
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
    );
  }
}
