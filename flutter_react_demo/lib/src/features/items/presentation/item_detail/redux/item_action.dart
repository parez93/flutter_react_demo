import 'package:flutter/foundation.dart';
import 'package:flutter_react_demo/src/features/items/data/fake_item_repository.dart';
import 'package:flutter_react_demo/src/features/items/data/item_repository.dart';
import 'package:flutter_react_demo/src/features/items/domain/item.dart';
import 'package:flutter_react_demo/src/store/app_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

class FetchItemAction {
  Item _item;
  Item get item => _item;

  FetchItemAction(this._item);
}

class CleanItemAction{}

class UpdateFavouriteAction {
  Map<String, bool> _favourites;

  Map<String, bool> get favourites => _favourites;

  UpdateFavouriteAction(this._favourites);
}

ThunkActionWithExtraArgument<AppState, String> fetchItem = (Store<AppState> store, String id) async {
  store.dispatch(CleanItemAction());
  ItemRepository repository = FakeItemRepository();
  Item item = await repository.fetchItem(id);
  debugPrint('fetchItem');
  store.dispatch(FetchItemAction(item));
};

ThunkActionWithExtraArgument<AppState, String> updateFavourite = (Store<AppState> store, String id) async {
  ItemRepository repository = FakeItemRepository();
  Map<String, bool> _favourites = store.state.favourites!;
  await repository.updateFavourite(id);
  if (_favourites.containsKey(id)) {
    _favourites[id] = !_favourites[id]!;
  } else {
    _favourites = {..._favourites, id: true};
  }
  store.dispatch(UpdateFavouriteAction(_favourites));
};
