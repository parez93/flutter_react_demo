import 'package:flutter/material.dart';
import 'package:flutter_react_demo/src/constants/test_item.dart';
import 'package:flutter_react_demo/src/features/items/data/item_repository.dart';
import 'package:flutter_react_demo/src/features/items/domain/item.dart';

class FakeItemRepository implements ItemRepository {

  @override
  Future<List<Item>> fetchItemList() {
    return Future.delayed(Durations.extralong4, () => items);
  }

  @override
  Future<Item> fetchItem(String id) {
    return Future.delayed(Durations.extralong4, () => items.firstWhere((element) => element.id == id));
  }

  @override
  Future<void> updateFavourite(String id) async {
    // Call to webservice
    await new Future.delayed(const Duration(milliseconds: 500));
  }

}