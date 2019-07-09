/*
 * @Author: Rongj
 * @Date: 2019-07-09 17:48:42
 * @LastEditTime: 2019-07-09 20:43:22
 */

import 'package:flutter/material.dart';
import 'package:app/widgets/connectivity_result.dart';

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
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Center(
              child: SizedBox(
                width: 80.0,
                height: 80.0,
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/cat.jpg"),
                ),
              ),
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
            leading: Icon(IconData(0xe617, fontFamily: 'iconfont'), color: Colors.black54,),
            title: Text('扫一扫'),
            trailing: Icon(IconData(0xe633, fontFamily: 'iconfont'), color: Colors.black26,),
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
            leading: Icon(IconData(0xe608, fontFamily: 'iconfont'), color: Colors.black54,),
            title: Text('地图'),
            trailing: Icon(IconData(0xe633, fontFamily: 'iconfont'), color: Colors.black26,),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(IconData(0xe73f, fontFamily: 'iconfont'), color: Colors.black54,),
            title: Text('图表'),
            trailing: Icon(IconData(0xe633, fontFamily: 'iconfont'), color: Colors.black26,),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(IconData(0xe601, fontFamily: 'iconfont'), color: Colors.black54,),
            title: Text('视频播放'),
            trailing: Icon(IconData(0xe633, fontFamily: 'iconfont'), color: Colors.black26,),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(IconData(0xe739, fontFamily: 'iconfont'), color: Colors.black54,),
            title: Text('分享'),
            onTap: () {},
          ),
        ],
      )
    );
  }
}