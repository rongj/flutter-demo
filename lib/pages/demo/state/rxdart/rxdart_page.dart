/*
 * @Author: Rongj
 * @Date: 2019-07-10 11:09:27
 * @LastEditTime: 2019-07-11 18:02:28
 */

import 'package:flutter/material.dart';
import 'streams/provider.dart';
import 'rxdart_home_page.dart';

class RxDartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: MaterialApp(
        title: 'RxDart',
        home: RxDartHomePage(),
      ),
    );
  }
}