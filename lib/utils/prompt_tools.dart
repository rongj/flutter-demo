/*
 * @Author: Rongj
 * @Date: 2019-07-10 10:13:30
 * @LastEditTime: 2019-07-10 13:37:30
 */

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PromptTools {
  static void toast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      timeInSecForIos: 1,
      backgroundColor: Color(0xB3000000),
      textColor: Colors.white,
      fontSize: 16.0
    );
  }
}