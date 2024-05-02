import 'package:flutter/material.dart';
import 'package:flutter_react_demo/src/features/items/presentation/item_detail/item_body.dart';
import 'package:flutter_react_demo/src/features/items/presentation/item_detail/item_button.dart';
import 'package:flutter_react_demo/src/features/items/presentation/item_detail/item_cover.dart';
import 'package:flutter_react_demo/src/features/items/presentation/item_detail/item_price.dart';
import 'package:flutter_react_demo/src/features/items/presentation/item_detail/item_rating.dart';

class ItemDetailPage extends StatelessWidget {
  const ItemDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                child: ItemCover(),
              ),
              SizedBox(height: 30),
              ItemRating(),
              SizedBox(height: 8),
              ItemBody(),
              SizedBox(height: 18),
              Row(
                children: [
                  ItemPrice(),
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



