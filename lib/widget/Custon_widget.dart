import 'dart:async';
import 'package:intl/intl.dart';
import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:jiffy/jiffy.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Api/api_service.dart';
import '../Model/leavedata.dart';
import '../Model/loginModel.dart';
import '../Model/loginModel.dart';
import '../Model/taskDescriptionList.dart';
import '../Screen/dashboard.dart';
import '../Screen/login_page.dart';
import '../Windows_Setting/WindowsSettingsFuntions.dart';
import '../const/const.dart';
import '../helper/shared_preference.dart';

// class CustomTextArea extends StatelessWidget {
//   final Widget prefix;
//   final FormFieldValidator<String> validator;
//   final bool isError;
//   final int maxLength;
//
//   final int maxLines;
//   final int minLines;
//   final String hintText;
//
//   final String titleText;
//   final TextEditingController fieldController;
//   final List<TextInputFormatter> textInputFormatter;
//   final TextInputType keyboardType;
//   final bool readOnly;
//   final bool isSecureTextField;
//   final String errorText;
//   final String initialValue;
//   final TextInputAction textInputAction;
//   final ValueChanged<String> onFieldSubmitted;
//   CustomTextArea(
//       {this.fieldController,
//         this.prefix,
//         this.isError,
//
//         this.hintText,
//         this.maxLength,
//         this.maxLines,
//         this.minLines,
//         this.textInputFormatter,
//         this.keyboardType,
//         this.readOnly,
//         this.validator,
//         this.errorText,
//         this.isSecureTextField,
//         this.textInputAction,
//         this.initialValue,
//         this.onFieldSubmitted,
//         this.titleText});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(
//           left: Responsive.isDesktop(context) ? defaultPadding : padding_10,
//           right: Responsive.isDesktop(context) ? defaultPadding : padding_10,
//           top: 20),
//       child: TextFormField(
//         autovalidateMode: AutovalidateMode.onUserInteraction,
//
//         maxLength: maxLength,
//         minLines: minLines,
//         initialValue: initialValue,
//         keyboardType: keyboardType,
//         readOnly: readOnly == null ? false : readOnly,
//         obscureText: isSecureTextField == null ? false : isSecureTextField,
//         inputFormatters: textInputFormatter,
//         controller: fieldController,
//         textInputAction: textInputAction,
//         validator: validator,
//         decoration: new InputDecoration(
//
//             fillColor: Colors.white,
//             border: new OutlineInputBorder(),
//             errorBorder: new OutlineInputBorder(
//               borderSide: BorderSide(color: primaryColor),
//             ),
//             focusedErrorBorder: new OutlineInputBorder(
//               borderSide: BorderSide(color: primaryColor),
//             ),
//             enabledBorder: new OutlineInputBorder(
//               borderSide: BorderSide(color: Colors.grey.shade300),
//             ),
//             focusedBorder: new OutlineInputBorder(
//               borderSide: BorderSide(color: primaryColor),
//             ),
//             focusColor: primaryColor,
//             labelStyle: TextStyle(color: Color(0XFF075A85)),
//
//             labelText: titleText,
//             hintStyle: TextStyle(color: Colors.grey),
//             hintText: hintText,
//             prefixIcon: prefix,
//             errorText: this.isError== null ?null:errorText,
//             filled: true),
//         onFieldSubmitted: onFieldSubmitted,
//         maxLines: isSecureTextField == true ? 1 : maxLines,
//       ),
//     );
//   }
// }

class CustomTextField extends StatelessWidget {
  final Widget prefix;
  final FormFieldValidator<String> validator;
  final bool isError;
  final int maxLength;
  final int maxLines;
  final int minLines;
  final String hintText;
  final String titleText;
  final TextEditingController fieldController;
  final List<TextInputFormatter> textInputFormatter;
  final TextInputType keyboardType;
  final bool readOnly;
  final bool isSecureTextField;
  final String errorText;
  final String initialValue;
  final TextInputAction textInputAction;
  final ValueChanged<String> onFieldSubmitted;
  CustomTextField(
      {required this.fieldController,
      required this.prefix,
      required this.isError,
      required this.hintText,
      required this.maxLength,
      required this.maxLines,
      required this.minLines,
      required this.textInputFormatter,
      required this.keyboardType,
      required this.readOnly,
      required this.validator,
      required this.errorText,
      required this.isSecureTextField,
      required this.textInputAction,
      required this.initialValue,
      required this.onFieldSubmitted,
      required this.titleText});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding:
            const EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Text(
                hintText,
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
            TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                obscureText:
                    isSecureTextField == null ? false : isSecureTextField,
                controller: this.fieldController,
                readOnly: readOnly == null ? false : readOnly,
                onFieldSubmitted: (value) {},
                validator: validator,
                decoration: InputDecoration(
                  hintText: hintText,
                  filled: true,
                  fillColor: Colors.white,
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class CustomElevatedButton extends StatelessWidget {
  final String title;
  final double width;
  final Function callBack;
  final double height;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;
  final IconData icon;
  final Color iconColor;
  final double iconSize;

  CustomElevatedButton(
      {required Key key,
      required this.callBack,
      required this.title,
      required this.width,
      required this.backgroundColor,
      required this.height,
      required this.fontSize,
      required this.textColor,
      required this.icon,
      required this.iconColor,
      required this.iconSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height == null ? 40 : height,
      child: icon != null
          ? ElevatedButton.icon(
              onPressed: () {
                callBack();
              },
              icon: Icon(
                icon,
                color: iconColor,
                size: iconSize,
              ),
              label: Text(
                title,
                style: TextStyle(color: textColor),
              ),
              style: ElevatedButton.styleFrom(
                primary: backgroundColor,
              ),
            )
          : ElevatedButton(
              onPressed: () {
                callBack();
              },
              child: Text(
                title,
                style: TextStyle(color: textColor),
              ),
              style: ElevatedButton.styleFrom(
                primary: backgroundColor,
              ),
            ),
    );
  }
}

// Widget customTextField(
//     String hintText,
//     TextEditingController txtCtrl,
//     bool isError,
//     bool isReadonly,
//    final FormFieldValidator<String> validator) {
//   return Flexible(
//     child: Padding(
//       padding: const EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 16),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(bottom: 6),
//             child: Text(
//               hintText,
//               style: TextStyle(fontSize: 20, color: Colors.black),
//             ),
//           ),
//           TextFormField(
//               controller: txtCtrl,
//               readOnly: isReadonly,
//               onFieldSubmitted: (value) {},
//               validator: validator,
//               decoration: InputDecoration(
//                 hintText: hintText,
//                 filled: true,
//                 fillColor: Colors.white,
//                 focusedErrorBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(5.0),
//                   borderSide: BorderSide(
//                     color: Colors.blue,
//                   ),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(5.0),
//                   borderSide: BorderSide(
//                     color: Colors.blue,
//                   ),
//                 ),
//                 errorBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(5.0),
//                   borderSide: BorderSide(
//                     color: Colors.blue,
//                   ),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(5.0),
//                   borderSide: BorderSide(
//                     color: Colors.blue,
//                   ),
//                 ),
//               )),
//         ],
//       ),
//     ),
//   );
// }
bool isValidEmail(input) {
  return RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(input);
}

class CustomFooter extends StatefulWidget {
  const CustomFooter({Key? key}) : super(key: key);

  @override
  State<CustomFooter> createState() => _CustomFooterState();
}

class _CustomFooterState extends State<CustomFooter> {
  _launchURL() async {
    const url = 'https://hrms.schedulesoftware.net/admin/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  var now;

  String fullName = '';
  @override
  void initState() {
    now = Jiffy().format('MMM do yyyy, h:mm:ss a');
    super.initState();

    Timer.periodic(Duration(seconds: 1), (Timer t) {
      if (!mounted) {
        return;
      }
      setState(() {
        now = Jiffy().format('MMM do yyyy, h:mm:ss a');
      });
    });
  }

  @override
  void dispose() {

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${now}",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ),
            Version(),
            InkWell(onTap: () => _launchURL(), child: copyRight())
          ],
        ),
      ),
    );
  }
}

Widget copyRight() {
  return Text(
    ConstValue().copyRight,
    style: TextStyle(
        color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600),
  );
}

Widget Version() {
  return Text(
    ConstValue().version,
    style: TextStyle(
        color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600),
  );
}

Widget pageResizeIcon() {
  return GestureDetector(
    onTap: () => WindowsFuntion().onWindowMaximize(),
    onDoubleTap: () => WindowsFuntion().onWindowResize(),
    child: Icon(
      Icons.zoom_in_map,
      size: 28,
      color: Colors.white,
    ),
  );
}

Widget logOut(BuildContext Cxt) {
  return GestureDetector(
      onTap: () => Navigator.of(Cxt)
          .push(MaterialPageRoute(builder: (context) => LoginPage())),
      child: Icon(
        Icons.login_outlined,
        size: 28,
        color: Colors.white,
      ));
}

Widget helpIcon() {
  return Icon(
    Icons.question_mark,
    size: 28,
    color: Colors.white,
  );
}

Widget alertIcon(BuildContext Cxt) {
  return GestureDetector(
    onTap: () => showDialog(
      context: Cxt,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.topRight,
            child: DefaultTabController(
                length: 4,
                child: SizedBox(
                  width: 400,
                  height: 500,
                  child: Scaffold(
                    appBar: AppBar(
                      elevation: 0,
                      automaticallyImplyLeading: false,
                      backgroundColor: Colors.white,
                      flexibleSpace: Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TabBar(
                              unselectedLabelColor: Colors.blue,
                              //  indicatorPadding: EdgeInsets.only(left: 30, right: 30),
                              indicator: ShapeDecoration(
                                  color: Colors.blue,
                                  shape: BeveledRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide(
                                        color: Colors.blue,
                                      ))),
                              isScrollable: true,
                              tabs: [
                                Tab(
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              ' Announcement',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            )))),
                                Tab(
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Birthadays',
                                          style: TextStyle(color: Colors.black),
                                        ))),
                                Tab(
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Work Anniversary',
                                          style: TextStyle(color: Colors.black),
                                        ))),
                                Tab(
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Holidays',
                                          style: TextStyle(color: Colors.black),
                                        ))),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    body: Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, top: 40),
                      child: TabBarView(
                        children: <Widget>[
                          Text(
                            'No Data found',
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            'No Data found',
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            'No Data found',
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            'No Data found',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
          ),
        );
      },
    ),
    child: Icon(
      Icons.add_alert,
      size: 28,
      color: Colors.white,
    ),
  );
}

Widget refreshIcon() {
  return Badge(
    badgeContent: Text(''),
    badgeColor: Colors.green,
    child: Icon(
      Icons.refresh,
      size: 28,
      color: Colors.white,
    ),
  );
}

Widget customButton(String text) {
  return Container(
    height: 38,
    width: 110,
    child: Center(
        child: Text(
      text,
      style: TextStyle(
          color: Colors.blue, fontSize: 15, fontWeight: FontWeight.bold),
    )),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(
          Radius.circular(5.0) //                 <--- border radius here
          ),
    ),
  );
}

class CustomLoginCard extends StatefulWidget {
  CustomLoginCard({Key? key}) : super(key: key);

  @override
  State<CustomLoginCard> createState() => _CustomLoginCardState();
}

class _CustomLoginCardState extends State<CustomLoginCard> {
  LoginResponseDone loginResponse = LoginResponseDone();
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();

  TextEditingController passController = TextEditingController();

  String fullName = '';

  onClickLogin() {
    callAPI(
            context,
            ApiConstant.login,
            ApiConstant.postMethod,
            {
              "username": nameController.text,
              "pass": passController.text,
              "DeviceID": "DesktopApp",
              "DeviceOS": "win32",
              "DeviceName": "TBS-053",
              "DeviceVersion": "10.0.19044",
              "IP": "192.168.1.53,172.23.144.1,172.20.32.1",
              "app_version": "2.0.4"
            },
            true)
        .then((response) {
      // isDataLoading = false;
      if (response != null) {
        setState(() {
          loginResponse = LoginResponseDone.fromJson(response);
          if (loginResponse.message != null) {
            _displayTextInputDialog(context, loginResponse.message);
          }

          if (loginResponse.message == null) {
            StorageHelper.setBoolVal(StorageHelper.isUserLoggedIn, true);

            StorageHelper.setStringVal(
                StorageHelper.userToken, loginResponse.data?.appToken);

            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => Dashboard()),
                (Route<dynamic> route) => false);
          }
        });
      }
    }).onError((error, stackTrace) {
      setState(() {});
    });
  }

  Future<void> _displayTextInputDialog(BuildContext context, text) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(text),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15, bottom: 15),
      height: MediaQuery.of(context).size.height * .7,
      width: MediaQuery.of(context).size.width * .35,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
            Radius.circular(15.0) //                 <--- border radius here
            ),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(
                text: ConstValue().companyNameTechno,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  color: Colors.black,
                  decoration: TextDecoration.underline,
                ),
                children: <TextSpan>[
                  TextSpan(
                      text: ConstValue().companyNameBrains,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: Colors.red,
                        decoration: TextDecoration.underline,
                      )),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: nameController,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return "Please enter username / email";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: ConstValue().enterUerNameLable,
                  ),
                  onChanged: (text) {
                    setState(() {
                      fullName = text;
                      //you can access nameController in its scope to get
                      // the value of text entered as shown below
                      //fullName = nameController.text;
                    });
                  },
                )),
            Container(
                margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
                child: TextFormField(
                  obscureText: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: passController,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return "Please enter password";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: ConstValue().passwordLable,
                  ),
                  onChanged: (text) {
                    setState(() {
                      fullName = text;
                      //you can access nameController in its scope to get
                      // the value of text entered as shown below
                      //fullName = nameController.text;
                    });
                  },
                )),
            GestureDetector(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  onClickLogin();
                }
              },
              // {
              //   Navigator.of(context)
              //       .push(MaterialPageRoute(builder: (context) => Dashboard()));
              // },
              child: Container(
                height: 40,
                width: 120,
                child: Center(
                    child: Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                )),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(
                          5.0) //                 <--- border radius here
                      ),
                ),
              ),
            ),
            SizedBox(height: 40,)
            // Text(
            //   "Create Account",
            //   style: TextStyle(
            //     fontWeight: FontWeight.w600,
            //     fontSize: 20,
            //     decoration: TextDecoration.underline,
            //   ),
            // ),
            // Text(
            //   "Forgot Password",
            //   style: TextStyle(
            //     fontSize: 18,
            //     decoration: TextDecoration.underline,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class ActiveTask extends StatefulWidget {
  const ActiveTask({Key? key}) : super(key: key);

  @override
  State<ActiveTask> createState() => _ActiveTaskState();
}

class _ActiveTaskState extends State<ActiveTask> {
  DateTime selectedDate1 = DateTime.now();
  DateTime selectedDate2 = DateTime.now();
  TextEditingController fromDate = new TextEditingController();
  TextEditingController toDate = new TextEditingController();
  Future<Null> _selectDate1(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate1,
        firstDate: DateTime(2022, 1),
        lastDate: DateTime(3500));
    if (picked != null && picked != selectedDate1)
      setState(() {
        selectedDate1 = picked;
        String formattedDate = DateFormat('yyyy-MM-dd').format(picked);
        fromDate.value = TextEditingValue(text: formattedDate);
      });
  }

  Future<Null> _selectDate2(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate2,
        firstDate: DateTime(2022, 1),
        lastDate: DateTime(3500));
    if (picked != null && picked != selectedDate2)
      setState(() {
        selectedDate2 = picked;
        String formattedDate = DateFormat('yyyy-MM-dd').format(picked);
        toDate.value = TextEditingValue(text: formattedDate);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 30,
        right: 10,
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "From:",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 18),
              ),
              GestureDetector(
                onTap: () => _selectDate1(context),
                child: Container(
                  height: 50,
                  width: 110,
                  child: Center(
                    child: Text(
                      "${fromDate.value.text}",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(
                            5.0) //                 <--- border radius here
                        ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "To:",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 18),
              ),
              GestureDetector(
                onTap: () => _selectDate2(context),
                child: Container(
                  height: 50,
                  width: 110,
                  child: Center(
                    child: Text(
                      "${toDate.value.text}",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(
                            5.0) //                 <--- border radius here
                        ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${ConstValue().activeTask}:",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 18),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(
                          5.0) //                 <--- border radius here
                      ),
                ),
                height: 50,
                width: MediaQuery.of(context).size.width * .45,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: GestureDetector(
                        onTap: () => showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                titlePadding: EdgeInsets.only(
                                    left:
                                        MediaQuery.of(context).size.width * .2,
                                    right:
                                        MediaQuery.of(context).size.width * .2,
                                    top: 10),
                                title: Center(
                                    child: Text(
                                  ConstValue().todayTaskDetails,
                                  style: TextStyle(color: Colors.blueAccent),
                                )),
                                content: Dropdown(),
                              );
                            }),
                        child: Text(
                          "Research and Development",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    Container(
                      width: 180,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 38,
                            width: 50,
                            child: Center(
                                child: Text(
                              ConstValue().stopButton,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            )),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.all(Radius.circular(
                                      5.0) //                 <--- border radius here
                                  ),
                            ),
                          ),
                          Container(
                            height: 38,
                            width: 90,
                            child: Center(
                                child: Text(
                              ConstValue().completeButton,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            )),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.all(Radius.circular(
                                      5.0) //                 <--- border radius here
                                  ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Dropdown extends StatefulWidget {
  @override
  _DropdownState createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  bool _enabled = true;
  int? value;
  String projectName = "";
  String taskName = "";
  String estimatedHours = "";
  String totalWrkingHours = "";
  String taskStart = "";
  String taskEnd = "";
  String taskDescription = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.0,
      width: 600.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          DropdownButton(
            focusColor: Colors.white,
            isExpanded: true,
            underline: Container(),
            disabledHint: value != null
                ? Text(itemsList().items.firstWhere(
                    (item) => item["value"] == value)["projectName"])
                : null,
            items: itemsList()
                .items
                .map((item) => DropdownMenuItem(
                      value: item["value"],
                      child: Text(
                        item["projectName"],
                        style: TextStyle(
                            color: Colors.black45,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ))
                .toList(),
            onChanged: _enabled
                ? (v) => setState(() {
                      value = v as int?;
                      projectName = itemsList().items.firstWhere(
                          (item) => item["value"] == value)["projectName"];
                      taskName = itemsList().items.firstWhere(
                          (item) => item["value"] == value)["taskName"];
                      estimatedHours = itemsList().items.firstWhere(
                          (item) => item["value"] == value)["estimatedHours"];
                      totalWrkingHours = itemsList().items.firstWhere(
                          (item) => item["value"] == value)["totalWrkingHours"];
                      taskStart = itemsList().items.firstWhere(
                          (item) => item["value"] == value)["taskStart"];
                      taskEnd = itemsList().items.firstWhere(
                          (item) => item["value"] == value)["taskEnd"];
                      taskDescription = itemsList().items.firstWhere(
                          (item) => item["value"] == value)["taskDescription"];
                    })
                : null,
            value: value,
          ),
          SizedBox(
            height: 40,
          ),
          value == null
              ? Container()
              : Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Project Name :",
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 60,
                        ),
                        Text(
                          projectName,
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      children: [
                        Text(
                          "Task Name :",
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 80,
                        ),
                        Text(
                          taskName,
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      children: [
                        Text(
                          "Estimated Hours :",
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          estimatedHours,
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      children: [
                        Text(
                          "Total Working Hours :",
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 0,
                        ),
                        Text(
                          totalWrkingHours,
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      children: [
                        Text(
                          "Task Start :",
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 90,
                        ),
                        Text(
                          taskStart,
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    Divider(),
                    Row(
                      children: [
                        Text(
                          "Task End :",
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 95,
                        ),
                        Text(
                          taskEnd,
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      children: [
                        Text(
                          "Task Description:",
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 35,
                        ),
                        Flexible(
                          child: Text(
                            taskDescription,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black45,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
        ],
      ),
    );
  }
}

class leavedownlist extends StatefulWidget {
  @override
  _leavedownlistState createState() => _leavedownlistState();
}

class _leavedownlistState extends State<leavedownlist> {
  bool _enabled = true;
  int? leaveID;
  String employeeName = "";
  String leaveType = "";
  String leaveStatus = "";
  String leaveReason = "";
  String leaveDate = "";
  String leaveApplyDate = "";
  String leaveComment = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.0,
      width: 600.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          DropdownButton(
            focusColor: Colors.white,
            isExpanded: true,
            underline: Container(),
            disabledHint: leaveID != null
                ? Text(leavedata().leave.firstWhere(
                    (item) => item["leaveID"] == leaveID)["employeeName"])
                : null,
            items: leavedata()
                .leave
                .map((item) => DropdownMenuItem(
                      value: item["leaveID"],
                      child: Text(
                        item["employeeName"],
                        style: TextStyle(
                            color: Colors.black45,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ))
                .toList(),
            onChanged: _enabled
                ? (v) => setState(() {
                      leaveID = v as int?;
                      employeeName = leavedata().leave.firstWhere(
                          (item) => item["leaveID"] == leaveID)["employeeName"];
                      leaveType = leavedata().leave.firstWhere(
                          (item) => item["leaveID"] == leaveID)["leaveType"];
                      leaveStatus = leavedata().leave.firstWhere(
                          (item) => item["leaveID"] == leaveID)["leaveStatus"];
                      leaveReason = leavedata().leave.firstWhere(
                          (item) => item["leaveID"] == leaveID)["leaveReason"];
                      leaveDate = leavedata().leave.firstWhere(
                          (item) => item["leaveID"] == leaveID)["leaveDate"];
                      leaveApplyDate = leavedata().leave.firstWhere((item) =>
                          item["leaveID"] == leaveID)["leaveApplyDate"];
                      leaveComment = leavedata().leave.firstWhere(
                          (item) => item["leaveID"] == leaveID)["leaveComment"];
                    })
                : null,
            value: leaveID,
          ),
          SizedBox(
            height: 40,
          ),
          leaveID == null
              ? Container()
              : Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Employee Name :",
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 60,
                        ),
                        Text(
                          employeeName,
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      children: [
                        Text(
                          "Leave Type :",
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 80,
                        ),
                        Text(
                          leaveType,
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      children: [
                        Text(
                          "Leave Status :",
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          leaveStatus,
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      children: [
                        Text(
                          "leave Reason :",
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 0,
                        ),
                        Text(
                          leaveReason,
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      children: [
                        Text(
                          "Leave Date :",
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 90,
                        ),
                        Text(
                          leaveDate,
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    Divider(),
                    Row(
                      children: [
                        Text(
                          "Leave Apply Date :",
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 95,
                        ),
                        Text(
                          leaveApplyDate,
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      children: [
                        Text(
                          "Leave Comment:",
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 35,
                        ),
                        Flexible(
                          child: Text(
                            leaveComment,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black45,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
        ],
      ),
    );
  }
}

enum SnackBarType { Error, Sueecss, Other }

void showSnackBar(BuildContext context, String content, String label,
    SnackBarType type, callback) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: SnackBarType.Error == type
          ? Colors.red[600]
          : SnackBarType.Sueecss == type
              ? Colors.green[600]
              : Colors.black,
      content: Text(
        content,
        style: TextStyle(fontSize: 16),
      ),
      action: label != ""
          ? SnackBarAction(label: label, onPressed: callback)
          : null,
    ),
  );
}
