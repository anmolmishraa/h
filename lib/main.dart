import 'dart:async';
import 'dart:io';
import 'package:window_manager/window_manager.dart';
import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'package:screen_capturer/screen_capturer.dart';


import 'ScreenSort/screensort.dart';
import 'Windows_Setting/WindowsSettings.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Must add this line.

  await windowManager.ensureInitialized();
  // await windowManager.setTitleBarStyle(TitleBarStyle.hidden,
  //     windowButtonVisibility: false);


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HRMSWindows(),
    );
  }
}
