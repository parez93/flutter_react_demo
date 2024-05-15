import 'package:flutter/material.dart';
import 'package:flutter_react_demo/src/features/items/presentation/item_detail/item_body.dart';
import 'package:flutter_react_demo/src/features/items/presentation/item_detail/item_button.dart';
import 'package:flutter_react_demo/src/features/items/presentation/item_detail/item_cover.dart';
import 'package:flutter_react_demo/src/features/items/presentation/item_detail/item_price.dart';
import 'package:flutter_react_demo/src/features/items/presentation/item_detail/item_rating.dart';
import 'package:flutter_react_demo/src/store/app_state.dart';
import 'package:flutter_react_demo/src/store/store.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'redux/item_action.dart';

class ItemDetailPage extends StatelessWidget {
  const ItemDetailPage({required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text('Details'),
          actions: [
            IconButton(
              icon: StoreConnector<AppState, AppState>(
                  converter: (store) => store.state,
                  distinct: false,
                  onInit: (store) => store.dispatch(fetchItem(store, id)),
                  builder: (_, state) {
                    if (state.favourites!.containsKey(id) &&
                        state.favourites![id] == true) {
                      return Icon(Icons.favorite, color: Colors.grey[800]);
                    }
                    return Icon(Icons.favorite_border_sharp);
                  }),
              onPressed: () => store.dispatch(
                updateFavourite(store, id),
              ),
            ),
          ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: StoreConnector<AppState, AppState>(
            converter: (store) => store.state,
            distinct: true,
            onInit: (store) => store.dispatch(fetchItem(store, id)),
            builder: (_, state) {
              debugPrint('>>> ${state.currentItem}, $id');
              if (state.currentItem == null)
                return Center(child: CircularProgressIndicator());
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30),
                  Center(
                    child: ItemCover(imageUrl: state.currentItem!.imageUrl),
                  ),
                  SizedBox(height: 30),
                  ItemRating(),
                  SizedBox(height: 8),
                  ItemBody(
                      title: state.currentItem!.title,
                      description: state.currentItem!.description),
                  SizedBox(height: 18),
                  Row(
                    children: [
                      ItemPrice(price: state.currentItem!.price),
                      Spacer(),
                      ItemButton()
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
