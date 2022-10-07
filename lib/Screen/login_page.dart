import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:window_manager/window_manager.dart';

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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      constraints: BoxConstraints.expand(),
      decoration: const BoxDecoration(
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
                SizedBox(width: 20,),
                pageResizeIcon(),
              ],
            ),
          ),
          CustomLoginCard(),
          CustomFooter()
        ],
      ),
    ));
  }


}
