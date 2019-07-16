/*
 * @Author: Rongj
 * @Date: 2019-07-11 17:10:46
 * @LastEditTime: 2019-07-16 11:55:38
 */

import 'package:flutter/material.dart';
import 'streams/provider.dart';

class RxDartChildPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('RxDart Child'),
        elevation: 0,
      ),
      body: Center(
        child: StreamBuilder(
          stream: bloc.stream,
          initialData: bloc.value,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return Text(
              '${snapshot.data}',
              style: TextStyle(fontSize: 48.0),
            );
          }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => bloc.increment(),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}