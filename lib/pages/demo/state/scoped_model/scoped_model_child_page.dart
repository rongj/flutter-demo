/*
 * @Author: Rongj
 * @Date: 2019-07-11 10:55:58
 * @LastEditTime: 2019-07-11 15:14:19
 */

import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import './models/count.dart';

class ScopedModelChildPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final countModel = ScopedModel.of<CountModel>(context, rebuildOnChange: true);
    return Scaffold(
      appBar: AppBar(
        title: Text('Scoped Model Child'),
        elevation: 0,
      ),
      body: Center(
        child: Text(
          '${countModel.count}',
          style: TextStyle(fontSize: 48.0),
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => countModel.increment(),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}