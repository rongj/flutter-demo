/*
 * @Author: Rongj
 * @Date: 2019-07-16 10:03:12
 * @LastEditTime: 2019-07-23 16:58:23
 */

import 'bloc_provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:app/services/api.dart';

class MainBloc implements BlocBase {
  BehaviorSubject<int> _mainController = BehaviorSubject<int>();
  Sink<int> get _mainSink => _mainController.sink;
  Stream<int> get mainStream => _mainController.stream;
  
  @override
  void dispose() {
    _mainController.close();
  }
}