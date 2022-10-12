import 'dart:async';

import 'package:desktoasts/desktoasts.dart';
import 'package:flutter/material.dart';
// import 'package:win_toast/win_toast.dart';
import 'package:window_manager/window_manager.dart';

import '../Api/api_service.dart';
import '../Screen/dashboard.dart';

import '../Screen/login_page.dart';
import '../helper/shared_preference.dart';
import 'WindowsSettingsFuntions.dart';

ToastService? service;

class HRMSWindows extends StatefulWidget {
  HRMSWindows({Key? key}) : super(key: key);

  @override
  State<HRMSWindows> createState() => _HRMSWindowsState();
}

class _HRMSWindowsState extends State<HRMSWindows> with WindowListener {
  // bool initialzied = false;
  @override
  void initState() {
    //
    // service = ToastService(
    //    appName: 'HRMSS',
    //    companyName: 'TechnoBrainssssss',
    //    productName: 'HRMSS',
    // );
    // scheduleMicrotask(() async {
    //   final ret = await WinToast.instance().initialize(
    //       appName: 'win_toast_example',
    //       productName: 'win_toast_example',
    //       companyName: 'mixin');
    //   assert(ret);
    //   setState(() {
    //     initialzied = true;
    //   });
    // });
    WindowOptions windowOptions = WindowOptions(
        //size: Size(1000, 700),
        title: "HRMS",
        center: true,
        backgroundColor: Colors.transparent,
        skipTaskbar: false);
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.setResizable(false);
      await windowManager.show();
      await windowManager.focus();
      // await windowManager.setMaximizable(false);
      // await windowManager.setMinimizable(false);
    });
    windowManager.addListener(this);

    _init();
    super.initState();
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  void _init() async {
    // Add this line to override the default close handler
    await windowManager.setPreventClose(true);

    setState(() {});
  }

  @override
  void onWindowClose() async {
    bool _isPreventClos = await windowManager.isPreventClose();
    if (_isPreventClos) {
      WindowsFuntion().onWindowClose();

      // Toast toast = Toast(
      //   type: ToastType.text02,
      //   title: 'HRMS APP',
      //   subtitle: 'HRMS App is Minimized',
      // );
      // final toast = await WinToast.instance().showToast(
      //     type: ToastType.text01, title: "Hello ");

      // service?.show(toast);

    }
  }
  //
  // navigate() async {
  //   if (await StorageHelper.getBoolVal(StorageHelper.isUserLoggedIn) == true) {
  //     Navigator.of(context).pushReplacement(MaterialPageRoute(
  //       builder: (context) => const Dashboard(),
  //     ));
  //   } else {
  //     Navigator.of(context).pushReplacement(MaterialPageRoute(
  //         builder: (BuildContext context) => const LoginPage()));
  //   }
  // }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Dashboard(),
    );
  }
}
