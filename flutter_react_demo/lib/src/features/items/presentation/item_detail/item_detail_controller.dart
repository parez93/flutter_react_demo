import 'package:flutter/material.dart';
import 'package:flutter_react_demo/src/features/items/data/fake_item_repository.dart';
import 'package:flutter_react_demo/src/features/items/data/item_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ItemDetailController
    extends StateNotifier<AsyncValue<Map<String, bool>>> {
  ItemDetailController({required this.repository}) : super(const AsyncData({}));

  final ItemRepository repository;

  bool isCurrentFavourited(String id) =>
      state.value!.containsKey(id) ? state.value![id]! : false;

  Future<void> updateFavourite(String id) async {
    Map<String, bool> _favourites = state.value!;
    state = const AsyncLoading();
    debugPrint('updateFavourite - waiting');

    await repository.updateFavourite(id);

    // debugPrint('<<< ${_favourites}');

    if (_favourites.containsKey(id)) {
      _favourites[id] = !_favourites[id]!;
    } else {
      _favourites = {..._favourites, id: true};
    }
    state = AsyncData(_favourites);
    // debugPrint('>>> ${_favourites}');

    debugPrint('updateFavourite - sucess');
  }
}

final itemDetailControllerProvider =
    StateNotifierProvider<ItemDetailController, AsyncValue<Map<String, bool>>>(
        (ref) {
  return ItemDetailController(repository: FakeItemRepository());
});
