import 'package:flutter/material.dart';
import 'package:flutter_react_demo/src/constants/test_item.dart';
import 'package:flutter_react_demo/src/features/items/data/item_repository.dart';
import 'package:flutter_react_demo/src/features/items/domain/item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

final fakeItemRepositoryProvider = Provider<FakeItemRepository>((ref) {
  return FakeItemRepository();
});

final futureItemListProvider = FutureProvider.autoDispose<List<Item>>((ref) {
  final repository = ref.watch(fakeItemRepositoryProvider);
  return repository.fetchItemList();
});

final futureItemProvider = FutureProvider.autoDispose.family<Item, String>((ref, String id) {
  final repository = ref.watch(fakeItemRepositoryProvider);
  return repository.fetchItem(id);
});

final futureUpdateFavouriteProvider = FutureProvider.autoDispose.family<void, String>((ref, String id) {
  final repository = ref.watch(fakeItemRepositoryProvider);
  return repository.updateFavourite(id);
});