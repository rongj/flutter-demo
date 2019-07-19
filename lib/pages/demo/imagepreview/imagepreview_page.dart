/*
 * @Author: Rongj
 * @Date: 2019-07-10 11:09:27
 * @LastEditTime: 2019-07-19 11:36:16
 */

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:app/components/plate_layout.dart';
import 'image_perview.dart';

class ImagePreviewPage extends StatelessWidget {

  final List<String> _basicImgs = [
    'assets/images/p1.jpg',
    'assets/images/p2.jpg',
  ];

  final List<String> _galleryImgs = [
    'assets/images/p3.jpg',
    'assets/images/p4.jpg',
    'assets/images/p5.jpg',
    'assets/images/p6.jpg',
    'assets/images/p7.jpg',
    'assets/images/p8.jpg',
    'assets/images/p9.jpg',
  ];

  Widget buildImgs(BuildContext context, List<String> imgs, double size, String type) {
    return Container(
      padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
      child: Wrap(
        runSpacing: 15.0,
        spacing: 15.0,
        children: imgs.asMap().keys.map((index){
          return InkWell(
            onTap: (){
              Navigator.of(context).push(CupertinoPageRoute(builder: (BuildContext context) {
                return ImagePerview(
                  type: type,
                  img: type == 'basic' ? imgs[index] : imgs,
                  initIndex: index 
                );
              }));
            },
            child: Image.asset(
              imgs[index],
              width: size,
              height: size,
              fit: BoxFit.cover,
            ),
          );
        }).toList(),
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    double _perWidth = (MediaQuery.of(context).size.width - 30 - 30) / 3;
    return Scaffold(
      appBar: AppBar(
        title: Text('图片预览'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            PlateLayout(
              title: 'Basic usage',
              body: buildImgs(context, _basicImgs, _perWidth, 'basic')
            ),
            PlateLayout(
              title: 'Gallery usage',
              body: buildImgs(context, _galleryImgs, _perWidth, 'gallery'),
            )
          ],
        ),
      ),
    );
  }
}