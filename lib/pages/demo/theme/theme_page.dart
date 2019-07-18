/*
 * @Author: Rongj
 * @Date: 2019-07-10 11:09:27
 * @LastEditTime: 2019-07-18 16:48:51
 */

import 'package:flutter/material.dart';
import 'package:app/routers.dart';
import 'package:app/configs/theme.dart';
import 'package:app/blocs/bloc_index.dart';

class ThemePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ApplicationBloc bloc = BlocProvider.of<ApplicationBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('主题'),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: '搜索',
            onPressed: () {
              Router.push(context, Router.searchPage);
            }
          ),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: themeConfigs.keys.map((k){
            Map item = themeConfigs[k];
            return Container(
              width: 300.0,
              child: FlatButton(
                color: item['primaryColor'],
                onPressed: () => bloc.changeTheme(k),
                child: Text(k, style: TextStyle(color: item['dark'] == false ? Colors.black : Colors.white),),
              )
            );
          }).toList(),
        ),
      ),
    );
  }
}