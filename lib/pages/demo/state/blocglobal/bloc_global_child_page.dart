/*
 * @Author: Rongj
 * @Date: 2019-07-11 17:10:46
 * @LastEditTime: 2019-07-11 17:55:12
 */

import 'package:flutter/material.dart';
import 'streams/main.dart';

class BlocGlobalChildPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc Single Global Child'),
        elevation: 0,
      ),
      body: Center(
        child: StreamBuilder(
          stream: bLoC.stream,
          initialData: bLoC.value,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return Text(
              '${snapshot.data}',
              style: TextStyle(fontSize: 48.0),
            );
          }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => bLoC.increment(),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}