/*
 * @Author: Rongj
 * @Date: 2019-06-27 13:57:56
 * @LastEditTime: 2019-07-04 16:40:28
 */

import 'package:flutter/material.dart';

class NovelTags extends StatelessWidget {
  NovelTags({
    Key key,
    this.tags,
    this.colourful = true
  }) : super(key: key);

  final String tags;
  final bool colourful;
  final List<Color> _tagsColor = const [
    Colors.blueAccent,
    Colors.redAccent,
    Colors.green,
    Colors.deepPurpleAccent,
    Colors.deepOrangeAccent,
    Colors.pinkAccent,
    Colors.lightBlueAccent,
  ];

  @override
  Widget build(BuildContext context) {
    final List<String> _tagsList = tags.split(',').where((o) => o.isNotEmpty).toList();
    return Row(
      children: List<Widget>.generate(_tagsList.length, (index){
        return Container(
          padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
          margin: EdgeInsets.only(right: 5.0, top: 5.0),
          decoration: BoxDecoration(
            border: Border.all(color: colourful ? _tagsColor[index] : Colors.transparent, width: 0.5),
            borderRadius: BorderRadius.circular(10.0),
            color: colourful ? Colors.white : Color(0xFFe8e8e8)
          ),
          child: Text(
            _tagsList[index],
            style: TextStyle(
              fontSize: 12.0,
              color: colourful ? _tagsColor[index] : Colors.black87,
            ),
          ),
        );
      }),
    );
  }
}