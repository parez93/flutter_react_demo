import 'package:flutter_react_demo/src/features/items/domain/item.dart';

class AppState {

  final List<Item> items;
  final Item? currentItem;
  final Map<String, bool>? favourites;

  AppState({required this.items, this.currentItem, this.favourites});


  AppState copyWith({
    List<Item>? items,
    Item? currentItem,
    Map<String, bool>? favourites,
  }) {
    return AppState(
      items: items ?? this.items,
      currentItem: currentItem,
      favourites: favourites ?? this.favourites,
    );
  }


  AppState.initialState() : items = [], currentItem = null, favourites = {};


  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppState &&
        other.items == items &&
        other.currentItem == currentItem &&
        other.favourites == favourites;
  }

  @override
  int get hashCode {
    return items.hashCode ^
    currentItem.hashCode ^
    favourites.hashCode;
  }
}