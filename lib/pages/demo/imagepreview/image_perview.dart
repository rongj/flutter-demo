/*
 * @Author: Rongj
 * @Date: 2019-07-19 10:43:52
 * @LastEditTime: 2019-07-19 11:28:24
 */

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ImagePerview extends StatelessWidget {
  ImagePerview({
    Key key,
    this.img,
    this.type,
    this.initIndex = 0
  }): assert(img != null),
      _pageController = PageController(initialPage: initIndex),
      super(key: key);

  final img;
  final String type;
  final int initIndex;
  final PageController _pageController;

  ImageProvider buildImage(img) {
    bool _isAsset = !img.startsWith('http:');
    return _isAsset ? AssetImage(img) : NetworkImage(img);
  }
  
  @override
  Widget build(BuildContext context) {    
    return Container(
      child: type == 'basic' ?
      PhotoView(
        imageProvider: buildImage(img),
      ) : 
      PhotoViewGallery.builder(
        scrollPhysics: const BouncingScrollPhysics(),
        builder: (BuildContext context, int index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: buildImage(img[index]),
            initialScale: PhotoViewComputedScale.contained * 0.9,
            maxScale: PhotoViewComputedScale.covered * 1.1,
            heroTag: img[index],
          );
        },
        itemCount: img.length,
        // loadingChild: widget.loadingChild,
        // backgroundDecoration: widget.backgroundDecoration,
        pageController: _pageController,
        // onPageChanged: onPageChanged,
      )
    );
  }
}