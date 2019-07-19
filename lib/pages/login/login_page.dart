/*
 * @Author: Rongj
 * @Date: 2019-07-19 14:52:34
 * @LastEditTime: 2019-07-19 14:56:35
 */

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录'),
      ),
    );
  }
}