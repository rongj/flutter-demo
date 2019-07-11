/*
 * @Author: Rongj
 * @Date: 2019-07-11 10:47:42
 * @LastEditTime: 2019-07-11 15:07:19
 */

import 'package:scoped_model/scoped_model.dart';

class CountModel extends Model {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}