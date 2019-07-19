/*
 * @Author: Rongj
 * @Date: 2019-07-16 10:03:12
 * @LastEditTime: 2019-07-19 17:12:07
 */

import 'bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

class ApplicationBloc implements BlocBase {
  /// theme-type
  BehaviorSubject<String> _themeController = BehaviorSubject<String>();
  Sink<String> get _themeSink => _themeController.sink;
  Stream<String> get themeStream => _themeController.stream;
  
  void changeTheme(String themeType) {
    _themeSink.add(themeType);
  }
  
  @override
  void dispose() {
    _themeController.close();
  }
}