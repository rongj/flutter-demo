/*
 * @Author: Rongj
 * @Date: 2019-07-11 15:19:31
 * @LastEditTime: 2019-07-11 17:04:25
 */

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'redux_child_page.dart';
import 'stores/main.dart';

class ReduxHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Map>(
      converter: (store) {
        print(store.state.main);
        return {
          'count': store.state.main.count,
          'user': store.state.auth.user,
          'callback': () => store.dispatch(Action.increment)
        };
      },
      builder: (context, store) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Flutter Redux Home -- ${store['count']}'),
            elevation: 0,
          ),
          body: Center(
            child: FlatButton(
              onPressed: () => store['callback'](),
              child: Text(
                '${store['user']}点了${store['count']}次',
                style: TextStyle(fontSize: 48.0),
              ),
            )
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                return ReduxChildPage();
              }));
            },
            child: Icon(Icons.arrow_forward),
          ),
        );
      },
    );
  }
}