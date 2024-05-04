import 'package:flutter_react_demo/src/features/items/domain/item.dart';

abstract class ItemRepository {
  Future<List<Item>> fetchItemList();

  Future<Item> fetchItem(String id);

  Future<void> updateFavourite(String id);
}
