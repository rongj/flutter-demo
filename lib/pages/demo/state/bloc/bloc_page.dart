/*
 * @Author: Rongj
 * @Date: 2019-07-10 11:09:27
 * @LastEditTime: 2019-07-11 17:57:54
 */

import 'package:flutter/material.dart';
import 'streams/provider.dart';
import 'bloc_home_page.dart';

class BlocPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: MaterialApp(
        title: 'Bloc',
        home: BlocHomePage(),
      ),
    );
  }
}