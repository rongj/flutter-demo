/*
 * @Author: Rongj
 * @Date: 2019-07-16 10:03:12
 * @LastEditTime: 2019-07-16 19:48:27
 */

import 'bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

class MainBloc implements BlocBase {
  
  BehaviorSubject<String> _appEvent = BehaviorSubject<String>();

  Sink<String> get _appEventSink => _appEvent.sink;

  Stream<String> get _appEventStream => _appEvent.stream;
  
  void sendAppEvent(String type) {
    _appEventSink.add(type);
  }

  @override
  void dispose() {
    _appEvent.close();
  }
}