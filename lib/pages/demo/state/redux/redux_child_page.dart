/*
 * @Author: Rongj
 * @Date: 2019-07-11 15:19:31
 * @LastEditTime: 2019-07-11 17:04:28
 */

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'stores/main.dart';

class ReduxChildPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Redux Child'),
        elevation: 0,
      ),
      body: Center(
        child: StoreConnector<AppState, int>(
          converter: (store) => store.state.main.count,
          builder: (context, count) {
            return Text(
              '$count',
              style: TextStyle(fontSize: 48.0),
            );
          },
        ),
      ),
      floatingActionButton: StoreConnector<AppState, VoidCallback>(
        converter: (store) {
          return () => store.dispatch(Action.increment);
        },
        builder: (context, callback) {
          return FloatingActionButton(
            onPressed: callback,
            child: Icon(Icons.add),
          );
        },
      ),
    );
  }
}