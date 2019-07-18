/*
 * @Author: Rongj
 * @Date: 2019-07-17 20:51:01
 * @LastEditTime: 2019-07-18 20:40:25
 */

import 'package:flutter/material.dart';
import 'dart:async';
import 'splash_guide.dart';
import 'splash_startup.dart';
import 'package:flutter/services.dart';
import 'package:app/routers.dart';
import 'package:app/utils/sp_utils.dart';
import 'package:app/configs/constant.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool _hideSplashGuide = true;
  
  Timer _timer;
  int _countdown = 5;
  
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    SpUtil.instance.getBool(Constant.SPLASH_GUIDE_HIDE, false).then((bool value) {
        setState(() {
          _hideSplashGuide = value;
        });
        if(value) {
          _startTimer();
        }
    });
  }
  
  // click entery
  void _goHome() {
    SpUtil.instance.setBool(Constant.SPLASH_GUIDE_HIDE, true);
    _goMain();
  }

  // goto homepage
  void _goMain() {
    Router.root(context);
  }

  // goto adpage
  void _goAdWeb() {
    _goMain();
    Router.push(context, Router.webviewPage, { 'title': '闪屏广告页', 'url': 'https://flutterchina.club/docs/' });
  }

  // skip countdown
  void _onSkipTap() {
    _timer?.cancel();
    _goMain();
  }

  // start timer
  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (t){
      setState(() {
        _countdown= _countdown - 1;
      });
      if(_countdown == 0) {
        _onSkipTap();
        return;
      }
    });
  }
  
  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
    _timer?.cancel();
  }
  
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          SplashGuide(
            show: !_hideSplashGuide,
            onEnteryTap: _goHome
          ),
          SplashStartup(
            show: _hideSplashGuide,
            onEnteryTap: _goAdWeb,
            onSkipTap: _onSkipTap,
            countdown: _countdown
          )
        ],
      ),
    );
  }
}