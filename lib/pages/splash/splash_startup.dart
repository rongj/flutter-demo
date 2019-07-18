/*
 * @Author: Rongj
 * @Date: 2019-07-18 10:13:13
 * @LastEditTime: 2019-07-18 18:29:59
 */

import 'package:flutter/material.dart';

class SplashStartup extends StatelessWidget {
  SplashStartup({
    Key key,
    this.show,
    this.onEnteryTap,
    this.onSkipTap,
    this.countdown
  }): super(key: key);

  final bool show;
  final Function onEnteryTap;
  final Function onSkipTap;
  final int countdown;

  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: !show,
      child: Container(
        color: Colors.grey,
        child: Stack(
          children: <Widget>[
            InkWell(
              onTap: onEnteryTap,
              child: Image.asset(
                'assets/images/gg.jpg',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 15.0,
              right: 20.0,
              child: FlatButton(
                onPressed: onSkipTap,
                shape: StadiumBorder(),
                color: Color(0x66000000),
                child: Text('$countdown s 后跳过', style: TextStyle(color: Colors.white),),
              ),
            )
          ],
        ),
      ),
    );
  }
}