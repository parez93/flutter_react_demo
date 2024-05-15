import 'package:flutter_react_demo/src/features/items/data/fake_item_repository.dart';
import 'package:flutter_react_demo/src/features/items/data/item_repository.dart';
import 'package:flutter_react_demo/src/features/items/domain/item.dart';
import 'package:flutter_react_demo/src/store/app_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

class FetchItemsAction {
  List<Item> _items = [];
  List<Item> get items => _items;

  FetchItemsAction(this._items);
}



ThunkAction<AppState> fetchItems = (Store<AppState> store) async {
  ItemRepository repository = FakeItemRepository();
  List<Item> items = await repository.fetchItemList();

  store.dispatch(FetchItemsAction(items));

};