/*
 * @Author: Rongj
 * @Date: 2019-07-16 10:03:12
 * @LastEditTime: 2019-07-18 16:48:45
 */

import 'bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

class ApplicationBloc implements BlocBase {
  /* theme-type */
  BehaviorSubject<String> _themeSubject = BehaviorSubject<String>();

  Sink<String> get _themeSink => _themeSubject.sink;

  Stream<String> get themeStream => _themeSubject.stream;
  
  void changeTheme(String themeType) {
    _themeSink.add(themeType);
  }
  

  @override
  void dispose() {
    _themeSubject.close();
  }
}