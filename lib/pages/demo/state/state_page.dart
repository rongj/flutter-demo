/*
 * @Author: Rongj
 * @Date: 2019-07-10 11:09:27
 * @LastEditTime: 2019-07-11 17:50:59
 */

import 'package:flutter/material.dart';
import 'package:app/routers.dart';

class StatePage extends StatelessWidget {  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('状态管理'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 300.0,
              child: FlatButton(
                color: Colors.lightBlueAccent,
                onPressed: () => Router.push(context, Router.reduxPage),
                child: Text('Redux', style: TextStyle(color: Colors.white),),
              ),
            ),
            Container(
              width: 300.0,
              child: FlatButton(
                color: Colors.redAccent,
                onPressed: () => Router.push(context, Router.scopedmodelPage, { 'context': context }),
                child: Text('Scoped Model', style: TextStyle(color: Colors.white),),
              ),
            ),
            Container(
              width: 300.0,
              child: FlatButton(
                color: Colors.orangeAccent,
                onPressed: () => Router.push(context, Router.blocPage),
                child: Text('Bloc', style: TextStyle(color: Colors.white),),
              ),
            ),
            Container(
              width: 300.0,
              child: FlatButton(
                color: Colors.deepPurple,
                onPressed: () => Router.push(context, Router.blocglobalPage),
                child: Text('Bloc Single Global', style: TextStyle(color: Colors.white),),
              ),
            ),
            Container(
              width: 300.0,
              child: FlatButton(
                color: Colors.blueAccent,
                onPressed: () => Router.push(context, Router.rxdartPage),
                child: Text('RxDart', style: TextStyle(color: Colors.white),),
              ),
            ),
            Container(
              width: 300.0,
              child: FlatButton(
                color: Colors.green,
                onPressed: () => Router.push(context, Router.eventbusPage),
                child: Text('EventBus', style: TextStyle(color: Colors.white),),
              ),
            ),
          ],
        ),
      )
    );
  }
}