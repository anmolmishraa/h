import 'dart:async';

import 'package:window_manager/window_manager.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Windows_Setting/WindowsSettings.dart';
import 'dart:async';
import 'dart:developer' as developer;
import 'dart:io';


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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


//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, this.title}) : super(key: key);
//
//   final String? title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   PackageInfo _packageInfo = PackageInfo(
//     appName: 'Unknown',
//     packageName: 'Unknown',
//     version: 'Unknown',
//     buildNumber: 'Unknown',
//     buildSignature: 'Unknown',
//     // installerStore: 'Unknown',
//   );
//
//   @override
//   void initState() {
//     super.initState();
//     _initPackageInfo();
//   }
//
//   Future<void> _initPackageInfo() async {
//     final info = await PackageInfo.fromPlatform();
//     setState(() {
//       _packageInfo = info;
//     });
//   }
//
//   Widget _infoTile(String title, String subtitle) {
//     return ListTile(
//       title: Text(title),
//       subtitle: Text(subtitle.isEmpty ? 'Not set' : subtitle),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title!),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           _infoTile('App name', _packageInfo.appName),
//           _infoTile('Package name', _packageInfo.packageName),
//           _infoTile('App version', _packageInfo.version),
//           _infoTile('Build number', _packageInfo.buildNumber),
//           _infoTile('Build signature', _packageInfo.buildSignature),
//           // _infoTile(
//           //   'Installer store',
//           //   _packageInfo.installerStore ?? 'not available',
//           // ),
//         ],
//       ),
//     );
//   }
// }