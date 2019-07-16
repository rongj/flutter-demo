/*
 * @Author: Rongj
 * @Date: 2019-07-16 10:03:12
 * @LastEditTime: 2019-07-16 19:59:10
 */

import 'bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

class ApplicationBloc implements BlocBase {
  BehaviorSubject<String> _appSubject = BehaviorSubject<String>();

  Sink<String> get _appSink => _appSubject.sink;

  Stream<String> get appStream => _appSubject.stream;
  
  void sendAppEvent(String type) {
    _appSink.add(type);
  }

  @override
  void dispose() {
    _appSubject.close();
  }
}