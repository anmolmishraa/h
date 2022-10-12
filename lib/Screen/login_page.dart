import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:window_manager/window_manager.dart';

import '../Api/api_service.dart';
import '../Model/AppInfo.dart';
import '../Windows_Setting/WindowsSettings.dart';
import '../Windows_Setting/WindowsSettingsFuntions.dart';
import '../main.dart';
import '../widget/Custon_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AppInfo appInfo = AppInfo();

  appInfoApi() {
    callAPI(
            context,
            ApiConstant.appInfo,
            ApiConstant.postMethod,
            {
              "company_id": "1",
              "user_id": "43",
              "DeviceID": "DesktopApp",
              "DeviceOS": "win32",
              "DeviceName": "TBS-053",
              "DeviceVersion": "10.0.19044",
              "IP": "192.168.1.53,172.23.144.1,172.20.32.1",
              "app_version": "2.0.4"
            },
            true)
        .then((response) {
      if (response != null) {
        setState(() {
          appInfo = AppInfo.fromJson(response);
        });
      }
    }).onError((error, stackTrace) {
      setState(() {});
    });
  }

  @override
  void initState() {
    appInfoApi();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        image: DecorationImage(
            image:
                NetworkImage("https://source.unsplash.com/user/c_v_r/1900x800"),
            fit: BoxFit.cover),
      ),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(top: 10, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                helpIcon(),
                SizedBox(
                  width: 20,
                ),
                pageResizeIcon(),
              ],
            ),
          ),
          CustomLoginCard(backgroundImage: appInfo.message?.backgroundImage),
          CustomFooter()
        ],
      ),
    ));
  }
}
