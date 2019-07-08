/*
 * @Author: Rongj
 * @Date: 2019-07-05 13:57:46
 * @LastEditTime: 2019-07-08 16:25:44
 */


import 'package:flutter/material.dart';
import 'package:app/services/api.dart';
import 'rank_type.dart';
import 'rank_source.dart';
import 'package:app/components/loading.dart';

class RankPage extends StatefulWidget {
  @override
  _RankPageState createState() => _RankPageState();
}

class _RankPageState extends State<RankPage> {
  List _dataSource = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    loadData('hot');
  }
  
  _onTypeChange(String type) {
    setState(() => _loading = true);
    loadData(type);
  }

  loadData(String type) async {
    List res;
    switch(type) {
      case 'hot':
        res = await Api.getRankHotList();
        break;
      case 'full':
        res = await Api.getRankFullList();
        break;
      case 'new':
        res = await Api.getRankNewList();
        break;
      case 'sell':
        res = await Api.getRankSellList();
        break;
      case 'collect':
        var _res = await Api.getRankCollectList();
        res = _res['data'];
        break;
      case 'click':
        var _res = await Api.getRankClickList();
        res = _res['data']['entityList'];
        break;
    }
    
    setState(() {
      _loading = false;
      _dataSource = res;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('排行榜'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.5,
      ),
      body: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            RankType(onTypeChange: _onTypeChange),
            Expanded(child: _loading ? Loading() : RankSource(dataSource: _dataSource))
          ],
        )
      ),
    );
  }
}
