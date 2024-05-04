import 'package:flutter/material.dart';
import 'package:flutter_react_demo/src/features/items/data/item_repository.dart';
import 'package:flutter_react_demo/src/features/items/domain/item.dart';

enum Status { Error, InProgress, Done }

class ItemDetailController extends ChangeNotifier {
  ItemDetailController({required this.repository});
  late ItemRepository repository;


  Status _operationStatus = Status.Done;
  Status get operationStatus => _operationStatus;


  List<Item> _items = [];
  get items => _items;

  Map<String, bool> _favourites = {};
  bool isCurrentFavourited(String id) => _favourites.containsKey(id) ? _favourites[id]! : false;

  Future<void> updateFavourite(String id) async {
    _operationStatus = Status.InProgress;
    notifyListeners();
    debugPrint('updateFavourite - waiting');

    await repository.updateFavourite(id);

    // debugPrint('<<< ${_favourites}');

    if (_favourites.containsKey(id)) {
      _favourites[id] = !_favourites[id]!;
    } else {
      _favourites = {..._favourites, id: true};
    }
    // debugPrint('>>> ${_favourites}');

    _operationStatus = Status.Done;
    notifyListeners();
    debugPrint('updateFavourite - sucess');
  }

}
