import 'dart:async';
import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../helper/shared_preference.dart';
import '../widget/Custon_widget.dart';
import 'api_exception.dart';

// import 'package:timeclockwizard/helper/constant.dart';
// import 'package:timeclockwizard/helper/shared_preference.dart';
// import 'package:timeclockwizard/model/loginResponse.dart';
// import 'package:timeclockwizard/services/api_exception.dart';

Map errorMessage = {};

class ApiService {
  static _returnResponse(http.Response response, BuildContext context) {
    errorMessage = jsonDecode(response.body);
    switch (response.statusCode) {
      case 200:
        return response.body;
      case 400:
        showSnackBar(
            context,
            errorMessage['message'] != null
                ? errorMessage['message']
                : response.body.toString(),
            "",
            SnackBarType.Error,
                () {});
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        showSnackBar(
            context,
            errorMessage['message'] != null
                ? errorMessage['message']
                : response.body.toString(),
            "",
            SnackBarType.Error,
                () {});
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        showSnackBar(
            context,
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}',
            "",
            SnackBarType.Error,
                () {});
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}

class ApiConstant {
  ApiConstant(_);
  static String hostUrl = "https://hrms.schedulesoftware.net";
  static String baseUrl = hostUrl + "/api/v_1_0/";
  static String getMethod = "get";
  static String postMethod = "post";
  static String putMethod = "put";
  static String login = "auth/login";
  static String sendForgotPassword = "";
  static String resetPassword = "";
  static String refreshToken = "";
  static String getProfile = "";
  static String updateProfile = "";
  static String changePassword = "";
  static String getLogEntries = "";
  static String getProjects = "";
  static String getTagsByProject = "";
  static String getProjectLogs = "";
  static String getProjectLogDetails = "";


}

Future callAPI(BuildContext _context, String action, String method,
    Map<dynamic, dynamic> params, bool isLoaderShow) async {
  if (isLoaderShow) {
    showLoader(_context);
  }

  var strURL = ApiConstant.baseUrl + action;
  var encodeUrl = Uri.parse(strURL);
  print(encodeUrl);
  print(params);

  final encoding = Encoding.getByName('utf-8');

  var requestHeaders = {
    'Content-type': 'application/json',
  };

  await StorageHelper.getStringVal(StorageHelper.userToken).then((value) {

    if (value != null) {
      requestHeaders['Authorization'] = "Bearer " + value;
    }
  });

  print("Headers $requestHeaders");

  if (method == ApiConstant.getMethod) {
    http.Response response = await http.get(
      encodeUrl,
      headers: requestHeaders,
    );
    var r;

    if (200 == response.statusCode) {
      r = utf8.decode(response.bodyBytes);
      // r = response.bodyBytes;
      print(r);
      print(response.body);

      print(response.statusCode);
      hideLoader();
      return jsonDecode(r);
    } else {
      r = response.bodyBytes;
      hideLoader();
      ApiService._returnResponse(response, _context);
      return jsonDecode(r);
    }
  } else if (method == ApiConstant.postMethod) {
    http.Response response = await http.post(encodeUrl,
        body: jsonEncode(params), encoding: encoding, headers: requestHeaders);
    var r;
    print(response.body);
    print(response.statusCode);
    if (200 == response.statusCode) {
      r = response.body;


      hideLoader();
      return jsonDecode(r);
    } else {
      r = response.body;
      hideLoader();
      ApiService._returnResponse(response, _context);
      return jsonDecode(r);
    }
  } else if (method == ApiConstant.putMethod) {
    http.Response response = await http.put(encodeUrl,
        body: jsonEncode(params), encoding: encoding, headers: requestHeaders);
    var r;
    print(response.body);
    print(response.statusCode);
    if (200 == response.statusCode) {
      r = response.body;
      hideLoader();
      return jsonDecode(r);
    } else {
      r = response.body;
      hideLoader();
      ApiService._returnResponse(response, _context);
      return jsonDecode(r);
    }
  }
}

OverlayState? overlayState;
OverlayEntry? overlayEntry;

showLoader(BuildContext context) async {
  overlayState = Overlay.of(context);

  if (overlayEntry == null) {
    overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: <Widget>[
          Container(
            color: Colors.black12,
          ),
          Positioned(
            child: Center(
              child: Container(
                // color: Colors.white,
                child: Image(
                  width: 120,
                  height: 120,
                  image: AssetImage('assets/loader.gif'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
    overlayState!.insert(overlayEntry!);
  }
}

hideLoader() {
  if (overlayEntry != null) {
    overlayEntry!.remove();
    overlayEntry = null;
  }
}
