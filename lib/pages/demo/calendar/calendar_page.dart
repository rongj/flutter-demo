/*
 * @Author: Rongj
 * @Date: 2019-07-10 11:09:27
 * @LastEditTime: 2019-07-19 15:22:58
 */

import 'package:flutter/material.dart';
// import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart' show CalendarCarousel;

class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('日历'),
      ),
      // body: SingleChildScrollView(
      //   child: Container(
      //     margin: EdgeInsets.symmetric(horizontal: 15.0),
      //     child: CalendarCarousel(
      //       weekendTextStyle: TextStyle(
      //         color: Colors.red,
      //       ),
      //       thisMonthDayBorderColor: Colors.grey,
      //       weekFormat: false,
      //       height: 430.0,
      //       daysHaveCircularBorder: false,
      //     ),
      //   ),
      // )
    );
  }
}