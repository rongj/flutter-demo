/*
 * @Author: Rongj
 * @Date: 2019-07-08 18:33:15
 * @LastEditTime: 2019-07-08 18:34:55
 */

import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('404'),
      ),
      body: Center(child: Text('404'),),
    );
  }
}