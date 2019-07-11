/*
 * @Author: Rongj
 * @Date: 2019-07-11 17:33:37
 * @LastEditTime: 2019-07-11 18:00:07
 */

import 'package:flutter/material.dart';
import 'main.dart';

class BlocProvider extends InheritedWidget {
  final CountBLoC bLoC = CountBLoC();

  BlocProvider({
    Key key,
    Widget child
  }): super(key: key, child: child);

  @override
  bool updateShouldNotify(_) => true;

  static CountBLoC of(BuildContext context) => (context.inheritFromWidgetOfExactType(BlocProvider) as BlocProvider).bLoC;
}