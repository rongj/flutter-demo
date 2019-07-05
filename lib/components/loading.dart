/*
 * @Author: Rongj
 * @Date: 2019-07-05 17:38:28
 * @LastEditTime: 2019-07-05 17:47:33
 */


import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SpinKitRipple(
        color: Theme.of(context).primaryColor,
        size: 50.0,
      )
    );
  }
}