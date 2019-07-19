/*
 * @Author: Rongj
 * @Date: 2019-07-10 11:09:27
 * @LastEditTime: 2019-07-19 10:02:26
 */

import 'dart:async';
import 'package:flutter/material.dart';
// import 'package:qrcode_reader/qrcode_reader.dart';

class ScanPage extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  // Future<String> _barcodeString;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('扫一扫'),
      ),
      // body: Center(
      //   child: FutureBuilder<String>(
      //     future: _barcodeString,
      //     builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
      //       return Text(snapshot.data != null ? snapshot.data : '');
      //     }
      //   )
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     setState(() {
      //       _barcodeString = QRCodeReader()
      //         .setAutoFocusIntervalInMs(200)
      //         .setForceAutoFocus(true)
      //         .setTorchEnabled(true)
      //         .setHandlePermissions(true)
      //         .setExecuteAfterPermissionGranted(true)
      //         // .setFrontCamera(false)
      //         .scan();
      //     });
      //   },
      //   tooltip: 'Reader the QRCode',
      //   child: Icon(Icons.add_a_photo),
      // ),
    );
  }
}