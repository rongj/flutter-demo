/*
 * @Author: Rongj
 * @Date: 2019-07-11 17:10:46
 * @LastEditTime: 2019-07-11 18:05:16
 */

import 'package:flutter/material.dart';
import 'streams/provider.dart';

class RxDartChildPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloC = BlocProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('RxDart Child'),
        elevation: 0,
      ),
      body: Center(
        child: StreamBuilder(
          stream: bloC.stream,
          initialData: bloC.value,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return Text(
              '${snapshot.data}',
              style: TextStyle(fontSize: 48.0),
            );
          }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => bloC.increment(),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}