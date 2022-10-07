import 'dart:async';
import 'dart:io';

import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screen_capturer/screen_capturer.dart';

import '../DataList/list.dart';
import '../const/const.dart';
import '../widget/Custon_widget.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool ascending = false;
  bool _isAccessAllowed = false;
  late Timer _timer;
  int _start = 10;
  CapturedData? _lastCapturedData;

  @override
  void initState() {
    // _handleClickCapture(CaptureMode.screen);
    super.initState();
    const onemin = const Duration(seconds: 10);
    _timer = new Timer.periodic(
      onemin,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
          print(_start);
        } else {
          setState(() {
            _start--;
          });
          _handleClickCapture(CaptureMode.screen);
          print(_start);
        }
      },
    );
    _init();
  }

  void _init() async {
    _isAccessAllowed = await ScreenCapturer.instance.isAccessAllowed();
  }

  String imagePath = "";
  void _handleClickCapture(CaptureMode mode) async {
    Directory directory = await getApplicationDocumentsDirectory();

    String imageName =
        'Screenshot-${DateTime.now().millisecondsSinceEpoch}.png';
    setState(() {
      imagePath = '${directory.path}$imageName';
    });

    _lastCapturedData = await ScreenCapturer.instance.capture(
      mode: mode,
      imagePath: imagePath,
      silent: true,
    );
    if (_lastCapturedData != null) {
      // ignore: avoid_print
      print(_lastCapturedData!.toJson());
    } else {
      // ignore: avoid_print
      print('User canceled capture');
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://source.unsplash.com/user/c_v_r/1900x800"),
              fit: BoxFit.cover),
        ),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding:
                  EdgeInsets.only(top: 12, left: 10, right: 10, bottom: 25),
              child: Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// Header Image:-
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 45,
                          backgroundColor: Colors.white,
                          child: ClipOval(
                            child: CachedNetworkImage(
                              imageUrl: "https://i.stack.imgur.com/0VpX0.png",
                              fit: BoxFit.cover,
                              width: 45,
                              height: 45,
                            ),
                          ),
                        ),
                        Text(
                          ConstValue().userName,
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),

                    /// Header button:-
                    Container(
                      width: MediaQuery.of(context).size.width * .20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          customButton(ConstValue().startBreak),
                          customButton(ConstValue().clockOut),
                        ],
                      ),
                    ),

                    /// Header Iocn :-
                    Container(
                      width: MediaQuery.of(context).size.width * .14,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          refreshIcon(),
                          alertIcon(context),
                          helpIcon(),
                          pageResizeIcon(),
                          logOut(context),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ActiveTask(),
            Container(
              padding: EdgeInsets.only(right: 10),
              height: 400,
              child: DataTableExample(),
            ),
            Spacer(
              flex: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: CustomFooter(),
            )
          ],
        ),
      ),
    );

    //   PreferenceList(
    //   children: <Widget>[
    //     if (Platform.isMacOS)
    //       PreferenceListSection(
    //         children: [
    //           PreferenceListItem(
    //             title: const Text('isAccessAllowed'),
    //             accessoryView: Text('$_isAccessAllowed'),
    //             onTap: () async {
    //               bool allowed =
    //               await ScreenCapturer.instance.isAccessAllowed();
    //               BotToast.showText(text: 'allowed: $allowed');
    //               setState(() {
    //                 _isAccessAllowed = allowed;
    //               });
    //             },
    //           ),
    //           PreferenceListItem(
    //             title: const Text('requestAccess'),
    //             onTap: () async {
    //               await ScreenCapturer.instance.requestAccess();
    //             },
    //           ),
    //         ],
    //       ),
    //     PreferenceListSection(
    //       title: const Text('METHODS'),
    //       children: [
    //         PreferenceListItem(
    //           title: const Text('capture'),
    //           accessoryView: Row(children: [
    //             CupertinoButton(
    //               child: const Text('region'),
    //               onPressed: () {
    //                 _handleClickCapture(CaptureMode.region);
    //               },
    //             ),
    //             CupertinoButton(
    //               child: const Text('screen'),
    //               onPressed: () {
    //                 _handleClickCapture(CaptureMode.screen);
    //               },
    //             ),
    //             CupertinoButton(
    //               child: const Text('window'),
    //               onPressed: () {
    //                 _handleClickCapture(CaptureMode.window);
    //               },
    //             ),
    //           ]),
    //         ),
    //       ],
    //     ),
    //     if (_lastCapturedData != null && _lastCapturedData?.imagePath != null)
    //       Container(
    //         margin: const EdgeInsets.only(top: 20),
    //         width: 400,
    //         height: 400,
    //         child: Image.file(
    //           File(_lastCapturedData!.imagePath!),
    //         ),
    //       ),
    //   ],
    // );
  }
}
