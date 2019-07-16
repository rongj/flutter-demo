/*
 * @Author: Rongj
 * @Date: 2019-07-10 11:09:27
 * @LastEditTime: 2019-07-16 20:23:53
 */

import 'package:flutter/material.dart';
import 'package:app/routers.dart';
import 'package:app/configs/theme.dart';
import 'package:app/blocs/bloc_index.dart';

// class ThemePage extends StatefulWidget {
//   @override
//   _ThemePageState createState() => _ThemePageState();
// }

// class _ThemePageState extends State<ThemePage> {

class ThemePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ApplicationBloc bloc = BlocProvider.of<ApplicationBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('主题'),
        // title: Text('主题', style: TextStyle(color: snapshot.data.iconColor),),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        // actionsIconTheme: IconThemeData(color: snapshot.data.iconColor),
        // iconTheme: IconThemeData(color: snapshot.data.iconColor),
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
                onPressed: () {
                  // ThemeConfig(k);
                  bloc.sendAppEvent(k);
                },
                child: Text(k, style: TextStyle(color: item['dark'] == false ? Colors.black : Colors.white),),
              )
            );
          }).toList(),
        ),
      ),
    );
    // return StreamBuilder(
    //   stream: themeBloC.stream,
    //   initialData: themeBloC.value,
    //   builder: (BuildContext context, AsyncSnapshot snapshot) {
    //     return Scaffold(
    //       appBar: AppBar(
    //         title: Text('主题${snapshot.data}'),
    //         // title: Text('主题', style: TextStyle(color: snapshot.data.iconColor),),
    //         centerTitle: true,
    //         // backgroundColor: snapshot.data.primaryColor,
    //         // actionsIconTheme: IconThemeData(color: snapshot.data.iconColor),
    //         // iconTheme: IconThemeData(color: snapshot.data.iconColor),
    //         actions: <Widget>[
    //           IconButton(
    //             icon: Icon(Icons.search),
    //             tooltip: '搜索',
    //             onPressed: () {
    //               Router.push(context, Router.searchPage);
    //             }
    //           ),
    //         ],
    //       ),
    //       body: Container(
    //         width: MediaQuery.of(context).size.width,
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: themeConfigs.keys.map((k){
    //             Map item = themeConfigs[k];
    //             return Container(
    //               width: 300.0,
    //               child: FlatButton(
    //                 color: item['primaryColor'],
    //                 onPressed: () => themeBloC.changeTheme(k),
    //                 child: Text(k, style: TextStyle(color: item['dark'] == false ? Colors.black : Colors.white),),
    //               )
    //             );
    //           }).toList(),
    //         ),
    //       ),
    //     );
    //   },
    // );
  }
}