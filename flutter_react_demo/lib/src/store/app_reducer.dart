import 'package:flutter_react_demo/src/features/items/presentation/item_detail/redux/item_action.dart';
import 'package:flutter_react_demo/src/features/items/presentation/item_list/redux/item_list_action.dart';
import 'package:flutter_react_demo/src/store/app_state.dart';


AppState appReducer(AppState prev, dynamic action) {
  if (action is FetchItemsAction) {
    return prev.copyWith(items: action.items);
  }
  if (action is FetchItemAction) {
    return prev.copyWith(currentItem: action.item);
  }
  if (action is CleanItemAction) {
    return prev.copyWith(currentItem: null);
  }
  if (action is UpdateFavouriteAction) {
    return prev.copyWith(favourites: action.favourites, currentItem: prev.currentItem);
  }
  else {
    return prev;
  }
}
