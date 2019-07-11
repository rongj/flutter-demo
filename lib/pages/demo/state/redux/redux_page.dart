/*
 * @Author: Rongj
 * @Date: 2019-07-10 11:09:27
 * @LastEditTime: 2019-07-11 17:04:20
 */

import 'package:flutter/material.dart';
import 'redux_home_page.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'stores/main.dart';

class ReduxPage extends StatelessWidget {
  final store = Store<AppState>(reducers, initialState: AppState(
    main: MainState(),
    auth: AuthState()
  ));
  
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Flutter Redux',
        home: ReduxHomePage(),
      ),
    );
  }
}