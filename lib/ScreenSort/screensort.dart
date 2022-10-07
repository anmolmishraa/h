// import 'dart:async';
// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:screen_capturer/screen_capturer.dart';
//
// class ScreenSort extends StatefulWidget {
//   const ScreenSort({Key? key}) : super(key: key);
//
//   @override
//   State<ScreenSort> createState() => _ScreenSortState();
// }
//
// class _ScreenSortState extends State<ScreenSort> {
//   bool _isAccessAllowed = false;
//   late Timer _timer;
//   int _start = 10;
//   CapturedData? _lastCapturedData;
//
//   @override
//   void initState() {
//
//     print("44444444444444444444444");
//
//     super.initState();
//     const onemin = const Duration(seconds: 10);
//     _timer = new Timer.periodic(
//       onemin,
//           (Timer timer) {
//         if (_start == 0) {
//           setState(() {
//             timer.cancel();
//           });
//           print(_start);
//         } else {
//           setState(() {
//             _start--;
//           });
//           _handleClickCapture(CaptureMode.screen);
//           print(_start);
//         }
//       },
//     );
//     _init();
//     return _handleClickCapture(CaptureMode.screen);
//   }
//
//   void _init() async {
//     _isAccessAllowed = await ScreenCapturer.instance.isAccessAllowed();
//   }
//
//   String imagePath = "";
//   void _handleClickCapture(CaptureMode mode) async {
//     Directory directory = await getApplicationDocumentsDirectory();
//
//     String imageName =
//         'Screenshot-${DateTime.now().millisecondsSinceEpoch}.png';
//     setState(() {
//       imagePath = '${directory.path}$imageName';
//     });
//
//     _lastCapturedData = await ScreenCapturer.instance.capture(
//       mode: mode,
//       imagePath: imagePath,
//       silent: true,
//     );
//     if (_lastCapturedData != null) {
//       // ignore: avoid_print
//       print(_lastCapturedData!.toJson());
//     } else {
//       // ignore: avoid_print
//       print('User canceled capture');
//     }
//     setState(() {});
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
//
