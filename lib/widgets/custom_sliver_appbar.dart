/*
 * @Author: Rongj
 * @Date: 2019-07-19 18:06:38
 * @LastEditTime: 2019-07-19 18:47:02
 */

import 'package:flutter/material.dart';
import 'package:app/widgets/custom_refresh_indicator.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomSliverAppBar extends StatelessWidget {
  CustomSliverAppBar({
    Key key,
    this.fixed = false,
    this.title,
    this.spaceBar,
    this.expandedHeight,
    this.actions,
    this.info
  }): super(key: key);

  final bool fixed;
  final String title;
  final Widget spaceBar;
  final double expandedHeight;
  final List<Widget> actions;
  final PullToRefreshScrollNotificationInfo info;
  
  Widget _buildRefreshSpin(BuildContext context, double spinOffset, String refreshText) {
    return Positioned(
      top: spinOffset,
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            SpinKitThreeBounce(
              color: Colors.white,
              size: 20.0,
            ),
            Text(
              refreshText,
              style: TextStyle(
                color: Colors.white,
                fontSize: 10.0,
              ),
            )
          ],
        ),
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: expandedHeight,
      flexibleSpace: FlexibleSpaceBar(
        background: spaceBar,
      ),
      title: Text(
        fixed ? title : '',
        style: TextStyle(color: fixed ? Theme.of(context).primaryColorDark : Colors.white),
      ),
      centerTitle: true,
      backgroundColor: fixed ? Theme.of(context).primaryColorLight : Colors.transparent,
      iconTheme: IconThemeData(color: fixed ? Theme.of(context).primaryColorDark : Colors.white),
      elevation: 0,
      actions: actions
    );
  }
}