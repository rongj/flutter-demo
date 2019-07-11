/*
 * @Author: Rongj
 * @Date: 2019-07-11 17:10:46
 * @LastEditTime: 2019-07-11 17:58:13
 */

import 'package:flutter/material.dart';
import 'bloc_child_page.dart';
import 'streams/provider.dart';

class BlocHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloC = BlocProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc Home'),
        elevation: 0,
      ),
      body: Center(
        child: StreamBuilder(
          stream: bloC.stream,
          initialData: bloC.value,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return FlatButton(
              onPressed: () => bloC.increment(),
              child: Text(
                '${snapshot.data}',
                style: TextStyle(fontSize: 48.0),
              ),
            );
          }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          return Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
            return BlocChildPage();
          }),);
        },
        tooltip: 'Increment',
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}