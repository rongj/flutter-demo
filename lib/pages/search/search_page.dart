/*
 * @Author: Rongj
 * @Date: 2019-06-24 15:26:27
 * @LastEditTime: 2019-07-02 10:53:00
 */

import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(

        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          children: <Widget>[
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('搜索热词', style: TextStyle(fontSize: 16.0, color: Colors.black54),),
                  Wrap(
                    spacing: 20.0,
                    children: List<Widget>.generate(12, (int index) {
                      return Container(
                        width: (MediaQuery.of(context).size.width - 40.0 - 60.0) / 4,
                        child: FlatButton(
                          onPressed: (){},
                          color: Colors.black12,
                          shape: StadiumBorder(),
                          child: Text('言情'),
                        )
                      );
                    }),
                  )
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}

