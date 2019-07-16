/*
 * @Author: Rongj
 * @Date: 2019-07-11 18:12:13
 * @LastEditTime: 2019-07-16 11:33:05
 */

import 'dart:async';
import 'bloc_provider.dart';
import 'package:app/configs/theme.dart';

/* 主题配置 */
class ThemeBloc implements BlocBase {
  String _themeType = 'primary';

  var _themeController = StreamController<String>.broadcast();
  
  Stream<String> get _themeStream => _themeController.stream;

  StreamSink get _themeSink => _themeController.sink;

  String _type;

  void changeTheme(_themeType) {
    print(_themeType);
    return _themeController.sink.add(_themeType);
  }

  @override
  dispose() {
    _themeController.close();
  }
}