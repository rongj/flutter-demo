/*
 * @Author: Rongj
 * @Date: 2019-06-24 15:06:35
 * @LastEditTime: 2019-07-10 11:00:30
 */

import 'package:flutter/material.dart';
import 'package:app/pages/bookshelf/bookshelf_page.dart';
import 'package:app/pages/bookcity/bookcity_page.dart';
import 'package:app/pages/selected/selected_page.dart';
import 'package:app/pages/my/my_page.dart';
import 'package:app/components/left_drawer.dart';

class ContainerPage extends StatefulWidget {
  ContainerPage({
    Key key,
    this.currentIndex = 0,
  }): super(key: key);
  final int currentIndex;

  @override
  _ContainerPageState createState() => _ContainerPageState();
}

class _ContainerPageState extends State<ContainerPage> {
  int _selectedIndex;
  Widget _bottomToolbar;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.currentIndex;
  }

  _onCheckChange(bool showCheck, [Widget bottomToolbar]) {
    setState(() {
      _bottomToolbar = showCheck ? bottomToolbar : null;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _widgetOptions = <Widget>[
      BookShelfPage(onCheckChange: _onCheckChange,),
      BookCityPage(),
      SelectedPage(),
      MyPage(),
    ];
    return Scaffold(
      drawer: LeftDrawer(),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: _bottomToolbar != null ? _bottomToolbar : BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(IconData(0xe65a, fontFamily: 'iconfont')),
            title: Text('书架'),
          ),
          BottomNavigationBarItem(
            icon: Icon(IconData(0xe673, fontFamily: 'iconfont')),
            title: Text('书城'),
          ),
          BottomNavigationBarItem(
            icon: Icon(IconData(0xe719, fontFamily: 'iconfont')),
            title: Text('精选'),
          ),
          BottomNavigationBarItem(
            icon: Icon(IconData(0xe718, fontFamily: 'iconfont')),
            title: Text('我的'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}