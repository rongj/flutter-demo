/*
 * @Author: Rongj
 * @Date: 2019-07-09 17:48:42
 * @LastEditTime: 2019-07-10 15:54:01
 */

import 'package:flutter/material.dart';
import 'package:app/widgets/connectivity_result.dart';
import 'package:app/routers.dart';

class LeftDrawer extends StatefulWidget {
  @override
  _LeftDrawerState createState() => _LeftDrawerState();
}

class _LeftDrawerState extends State<LeftDrawer> {  
  bool _bluetoothStatus = true;
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 80.0,
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Center(
              child: Text('测试DEMO', style: TextStyle(color: Colors.white, fontSize: 18.0),),
            ),
          ),
          ListTile(
            leading: Icon(IconData(0xe642, fontFamily: 'iconfont'), color: Colors.black54,),
            title: Text('蓝牙'),
            trailing: Switch(
              value: _bluetoothStatus,
              activeColor: Colors.blue,     // 激活时原点颜色
              onChanged: (bool val) {
                this.setState(() => _bluetoothStatus = !_bluetoothStatus);
              },
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(IconData(0xe615, fontFamily: 'iconfont'), color: Colors.black54,),
            title: Text('网络状态'),
            onTap: () {
              NetworkState.getNetworkState();
            },
            trailing: Text('wifi', style: TextStyle(color: Theme.of(context).primaryColor),)
          ),
          ListTile(
            leading: Icon(IconData(0xe619, fontFamily: 'iconfont'), color: Colors.black54,),
            title: Text('定位'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(IconData(0xe720, fontFamily: 'iconfont'), color: Colors.black54,),
            title: Text('本地通知'),
            trailing: Text('发送测试'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(IconData(0xe739, fontFamily: 'iconfont'), color: Colors.black54,),
            title: Text('分享'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(IconData(0xe61d, fontFamily: 'iconfont'), color: Colors.black54,),
            title: Text('打开文件'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(IconData(0xe617, fontFamily: 'iconfont'), color: Colors.black54,),
            title: Text('扫一扫'),
            trailing: Icon(IconData(0xe633, fontFamily: 'iconfont'), color: Colors.black26,),
            onTap: () => Router.push(context, Router.scanPage),
          ),
          ListTile(
            leading: Icon(IconData(0xe60b, fontFamily: 'iconfont'), color: Colors.black54,),
            title: Text('主题'),
            trailing: Icon(IconData(0xe633, fontFamily: 'iconfont'), color: Colors.black26,),
            onTap: () => Router.push(context, Router.themePage),
          ),
          ListTile(
            leading: Icon(IconData(0xe6ea, fontFamily: 'iconfont'), color: Colors.black54,),
            title: Text('路由'),
            trailing: Icon(IconData(0xe633, fontFamily: 'iconfont'), color: Colors.black26,),
            onTap: () => Router.push(context, Router.routePage),
          ),
          ListTile(
            leading: Icon(IconData(0xe652, fontFamily: 'iconfont'), color: Colors.black54,),
            title: Text('设备信息'),
            trailing: Icon(IconData(0xe633, fontFamily: 'iconfont'), color: Colors.black26,),
            onTap: () => Router.push(context, Router.deviceinfoPage),
          ),
          ListTile(
            leading: Icon(IconData(0xe61c, fontFamily: 'iconfont'), color: Colors.black54,),
            title: Text('权限获取'),
            trailing: Icon(IconData(0xe633, fontFamily: 'iconfont'), color: Colors.black26,),
            onTap: () => Router.push(context, Router.permissionPage),
          ),
          ListTile(
            leading: Icon(IconData(0xe67e, fontFamily: 'iconfont'), color: Colors.black54,),
            title: Text('图片预览'),
            trailing: Icon(IconData(0xe633, fontFamily: 'iconfont'), color: Colors.black26,),
            onTap: () => Router.push(context, Router.imagepreviewPage),
          ),
          ListTile(
            leading: Icon(IconData(0xe608, fontFamily: 'iconfont'), color: Colors.black54,),
            title: Text('地图'),
            trailing: Icon(IconData(0xe633, fontFamily: 'iconfont'), color: Colors.black26,),
            onTap: () => Router.push(context, Router.mapPage),
          ),
          ListTile(
            leading: Icon(IconData(0xe73f, fontFamily: 'iconfont'), color: Colors.black54,),
            title: Text('图表'),
            trailing: Icon(IconData(0xe633, fontFamily: 'iconfont'), color: Colors.black26,),
            onTap: () => Router.push(context, Router.chartPage),
          ),
          ListTile(
            leading: Icon(IconData(0xe789, fontFamily: 'iconfont'), color: Colors.black54,),
            title: Text('日历'),
            trailing: Icon(IconData(0xe633, fontFamily: 'iconfont'), color: Colors.black26,),
            onTap: () => Router.push(context, Router.calendarPage),
          ),
          ListTile(
            leading: Icon(IconData(0xe601, fontFamily: 'iconfont'), color: Colors.black54,),
            title: Text('视频播放'),
            trailing: Icon(IconData(0xe633, fontFamily: 'iconfont'), color: Colors.black26,),
            onTap: () => Router.push(context, Router.videoPage),
          ),
        ],
      )
    );
  }
}