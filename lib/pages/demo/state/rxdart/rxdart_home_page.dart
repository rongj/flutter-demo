/*
 * @Author: Rongj
 * @Date: 2019-07-11 17:10:46
 * @LastEditTime: 2019-07-11 18:05:12
 */

import 'package:flutter/material.dart';
import 'rxdart_child_page.dart';
import 'streams/provider.dart';

class RxDartHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloC = BlocProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('RxDart Home'),
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
            return RxDartChildPage();
          }),);
        },
        tooltip: 'Increment',
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}