/*
 * @Author: Rongj
 * @Date: 2019-07-16 10:03:12
 * @LastEditTime: 2019-07-19 17:19:35
 */

import 'bloc_provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:app/services/api.dart';
// import 'package:app/utils/logger.dart';

class BookCityBloc implements BlocBase {
  // final _logger = Logger('BookCityBloc');
  
  /// ------------ 推荐 ----------------- ///
  /// 本周热门
  BehaviorSubject<List> _weekController = BehaviorSubject<List>();
  Sink<List> get _weekSink => _weekController.sink;
  Stream<List> get weekStream => _weekController.stream;
  List _weekList;

  /// 猜你喜欢
  BehaviorSubject<List> _guessController = BehaviorSubject<List>();
  Sink<List> get _guessSink => _guessController.sink;
  Stream<List> get guessStream => _guessController.stream;
  List _guessList;

  /// 精品汇聚
  BehaviorSubject<List> _qualityController = BehaviorSubject<List>();
  Sink<List> get _qualitySink => _qualityController.sink;
  Stream<List> get qualityStream => _qualityController.stream;
  List _qualityList;

  /// 热门推荐
  BehaviorSubject<List> _hotController = BehaviorSubject<List>();
  Sink<List> get _hotSink => _hotController.sink;
  Stream<List> get hotStream => _hotController.stream;
  List _hotList;

  // void getData() {
  //   getWeekData();
  // }

  // Future getWeekData() async {
  //   return Api.getWeekList().then((value) {
  //     print(value);
  //   });
  // }

  @override
  void dispose() {
    _weekController.close();
    _guessController.close();
    _qualityController.close();
    _hotController.close();
  }
}