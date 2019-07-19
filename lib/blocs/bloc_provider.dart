/*
 * @Author: Rongj
 * @Date: 2019-07-16 10:06:16
 * @LastEditTime: 2019-07-19 15:38:41
 */

import 'package:flutter/material.dart';

abstract class BlocBase {
  // Future getData();

  // Future onRefresh();

  // Future onLoadMore();
  
  void dispose();
}

class BlocProvider<T extends BlocBase> extends StatefulWidget {
  BlocProvider({
    Key key,
    @required this.child,
    @required this.bloc,
  }): super(key: key);

  final T bloc;
  final Widget child;
  
  @override
  _BlocProviderState<T> createState() => _BlocProviderState<T>();
  
  static Type _typeOf<T>() => T;
  
  static T of<T extends BlocBase>(BuildContext context) {
    final type = _typeOf<BlocProvider<T>>();
    BlocProvider<T> provider = context.ancestorWidgetOfExactType(type);
    return provider.bloc;
  }
}

class _BlocProviderState<T> extends State<BlocProvider<BlocBase>> {
  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}