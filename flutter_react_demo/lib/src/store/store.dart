
import 'package:flutter_react_demo/src/store/app_reducer.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'app_state.dart';

final Store<AppState> store = Store<AppState>(appReducer,
    initialState: AppState.initialState(), middleware: [thunkMiddleware]);
