/*
 * @Author: Rongj
 * @Date: 2019-07-11 10:55:58
 * @LastEditTime: 2019-07-11 15:53:57
 */

import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'scoped_model_child_page.dart';
import './models/count.dart';

class ScopedModelHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<CountModel>(
      builder: (context, child, model) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Scoped Model Home -- ${model.count}'),
            elevation: 0,
          ),
          body: Center(
            child: FlatButton(
              onPressed: () => model.increment(),
              child: Text(
                '${model.count}',
                style: TextStyle(fontSize: 48.0),
              ),
            )
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              return Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                return ScopedModelChildPage();
              }),);
            },
            tooltip: 'Increment',
            child: Icon(Icons.arrow_forward),
          ),
        );
      },
    );
  }
}