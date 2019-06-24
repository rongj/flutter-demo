/*
 * @Author: Rongj
 * @Date: 2019-06-24 15:06:35
 * @LastEditTime: 2019-06-24 15:47:04
 */

import 'package:flutter/material.dart';
import 'package:app/pages/bookshelf/bookshelf_page.dart';
import 'package:app/pages/bookcity/bookcity_page.dart';
import 'package:app/pages/selected/selected_page.dart';
import 'package:app/pages/my/my_page.dart';

class ContainerPage extends StatefulWidget {
  ContainerPage({Key key}) : super(key: key);

  @override
  _ContainerPageState createState() => _ContainerPageState();
}

class _ContainerPageState extends State<ContainerPage> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    BookShelfPage(),
    BookCityPage(),
    SelectedPage(),
    MyPage(),
  ];

    // BookShelfPage(),
    // BookCityPage(),
    // SelectedPage(),
    // MyPage(),

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('书架'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            title: Text('书城'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.poll),
            title: Text('精选'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
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