/*
 * @Author: Rongj
 * @Date: 2019-07-10 11:09:27
 * @LastEditTime: 2019-07-11 17:13:09
 */

import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'scoped_model_home_page.dart';
import './models/count.dart';

class ScopedModelPage extends StatelessWidget {
  // 顶层创建CountModel实例
  final CountModel countModel = CountModel();
  
  @override
  Widget build(BuildContext context) {
    // ScopedModel<T extends Model>是一个StatelessWidget，它接收一个model并提供给需要它的所有部件
    return ScopedModel<CountModel>(
      // 将ScopedModel<T extends Model>的model属性绑定我们的CountModel对象
      model: countModel,
      child: MaterialApp(
        title: 'Scoped Model',
        home: ScopedModelHomePage(),
      ),
    );
  }
}