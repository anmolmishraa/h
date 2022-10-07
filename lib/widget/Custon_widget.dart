import 'dart:async';

import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:jiffy/jiffy.dart';

import '../Screen/dashboard.dart';
import '../Screen/login_page.dart';
import '../Windows_Setting/WindowsSettingsFuntions.dart';
import '../const/const.dart';
import '../main.dart';

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

// class CustomIconButton extends StatelessWidget {
//   final IconData icon;
//   final void Function() press;
//   final Function onHoverCallBack;
//   final Color iconColor;
//   const CustomIconButton(
//       {Key key, this.icon, this.press, this.iconColor, this.onHoverCallBack})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(right: 8),
//       child: InkWell(
//         onTap: press,
//         onHover: (isHover) {},
//         child: Icon(
//           icon,
//           color: iconColor != null ? iconColor : Colors.white,
//         ),
//       ),
//     );
//   }
// }
//
// Widget headerWithIcon(IconData _icon, String _title, BuildContext context) {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.start,
//     children: [
//       Icon(
//         _icon,
//         size: 18.0,
//       ),
//       SizedBox(
//         width: 25,
//       ),
//       Text(
//         _title,
//         style: TextStyle(
//             fontSize: Responsive.isMobile(context) ? 14.0 : 18.0,
//             fontWeight: FontWeight.bold),
//       ),
//     ],
//   );
// }
//
// Widget iconWithText(String label, IconData icon, String value) {
//   return Wrap(
//     children: [
//       Icon(icon),
//       SizedBox(width: 15.0),
//       Text(label),
//     ],
//   );
// }

class  CustomFooter extends StatefulWidget {
  const CustomFooter({Key? key}) : super(key: key);

  @override
  State<CustomFooter> createState() => _CustomFooterState();
}

class _CustomFooterState extends State<CustomFooter> {
  var now;

  String fullName = '';
  @override
  void initState() {
    now = Jiffy().format('MMM do yyyy, h:mm:ss a');
    super.initState();

    Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        now = Jiffy().format('MMM do yyyy, h:mm:ss a');
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child:     Padding(
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
            copyRight()
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
        color: Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.w600),
  );
}



Widget Version() {
  return Text(
    ConstValue().version,
    style: TextStyle(
        color: Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.w600),
  );
}
Widget pageResizeIcon(){
  return  GestureDetector(
    onTap:()=>WindowsFuntion().onWindowMaximize(),
    onDoubleTap: ()=>WindowsFuntion().onWindowResize(),
    child: Icon(
      Icons.zoom_in_map,
      size: 28,
      color: Colors.white,
    ),
  );
}
Widget logOut(BuildContext Cxt ){
  return  GestureDetector(
    onTap:()=>Navigator.of(Cxt).push(MaterialPageRoute(builder: (context) => LoginPage())),

    child:    Icon(
      Icons.login_outlined,
      size: 28,
      color: Colors.white,
    )
  );
}
Widget helpIcon(){
  return   Icon(
    Icons.question_mark,
    size: 28,
    color: Colors.white,
  );
}
Widget alertIcon(BuildContext Cxt){
 return    GestureDetector(
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
                       padding: EdgeInsets.only(
                           left: 10, right: 10),
                       child: Column(
                         mainAxisAlignment:
                         MainAxisAlignment.end,
                         children: [
                           TabBar(
                             unselectedLabelColor:
                             Colors.blue,
                             //  indicatorPadding: EdgeInsets.only(left: 30, right: 30),
                             indicator: ShapeDecoration(
                                 color: Colors.blue,
                                 shape: BeveledRectangleBorder(
                                     borderRadius: BorderRadius.circular(10),
                                     side: BorderSide(
                                       color:
                                       Colors.blue,
                                     ))),
                             isScrollable: true,
                             tabs: [
                               Tab(
                                   child: Align(
                                       alignment:
                                       Alignment
                                           .center,
                                       child: Align(
                                           alignment:
                                           Alignment
                                               .center,
                                           child: Text(
                                             ' Announcement',
                                             style: TextStyle(
                                                 color:
                                                 Colors.black),
                                           )))),
                               Tab(
                                   child: Align(
                                       alignment:
                                       Alignment
                                           .center,
                                       child: Text(
                                         'Birthadays',
                                         style: TextStyle(
                                             color: Colors
                                                 .black),
                                       ))),
                               Tab(
                                   child: Align(
                                       alignment:
                                       Alignment
                                           .center,
                                       child: Text(
                                         'Work Anniversary',
                                         style: TextStyle(
                                             color: Colors
                                                 .black),
                                       ))),
                               Tab(
                                   child: Align(
                                       alignment:
                                       Alignment
                                           .center,
                                       child: Text(
                                         'Holidays',
                                         style: TextStyle(
                                             color: Colors
                                                 .black),
                                       ))),
                             ],
                           ),
                         ],
                       ),
                     ),
                   ),
                   body: Padding(
                     padding: EdgeInsets.only(
                         left: 10, right: 10, top: 40),
                     child: TabBarView(
                       children: <Widget>[
                         Text(
                           'No Data found',
                           style: TextStyle(
                               color: Colors.black),
                         ),
                         Text(
                           'No Data found',
                           style: TextStyle(
                               color: Colors.black),
                         ),
                         Text(
                           'No Data found',
                           style: TextStyle(
                               color: Colors.black),
                         ),
                         Text(
                           'No Data found',
                           style: TextStyle(
                               color: Colors.black),
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
Widget refreshIcon(){
  return     Badge(
    badgeContent: Text(''),
    badgeColor: Colors.green,
    child: Icon(
      Icons.refresh,
      size: 28,
      color: Colors.white,
    ),
  );
}
Widget customButton(String text){
  return Container(
    height: 38,
    width: 110,
    child: Center(
        child: Text(
          text,
          style: TextStyle(
              color: Colors.blue,
              fontSize: 15,
              fontWeight: FontWeight.bold),
        )),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(
          5.0) //                 <--- border radius here
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
  TextEditingController nameController = TextEditingController();

  TextEditingController passController = TextEditingController();

   String fullName = '';

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.only(top: 15,bottom: 15),
      height: MediaQuery.of(context).size.height * .7,
      width: MediaQuery.of(context).size.width * .35,
      decoration: BoxDecoration(
color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(
            15.0) //                 <--- border radius here
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(

      text: TextSpan(
      text: ConstValue().companyNameTechno,
        style:TextStyle(fontWeight: FontWeight.bold,fontSize: 35,color: Colors.black,decoration: TextDecoration.underline,),
        children: <TextSpan>[
          TextSpan(
              text: ConstValue().companyNameBrains, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35,color: Colors.red,decoration: TextDecoration.underline,)),
        ],
      ),

          ),
          Container(
              margin: EdgeInsets.only(left: 20,right: 20,top: 20),
              child: TextField(
                controller: nameController,
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
              margin: EdgeInsets.only(bottom: 20,left: 20,right: 20),
              child: TextField(
                controller: passController,
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
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Dashboard()));
            },
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

          Text("Create Account",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,decoration: TextDecoration.underline,),),
          Text("Forgot Password",style: TextStyle(fontSize: 18,decoration: TextDecoration.underline,),),
        ],
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
  @override
  Widget build(BuildContext context) {
    return
      Padding(
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
                Container(
                  height: 50,
                  width: 110,
                  child: Center(
                      child: Text(
                    "04/10/2022",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  )),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(
                            5.0) //                 <--- border radius here
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
                Container(
                  height: 50,
                  width: 110,
                  child: Center(
                      child: Text(
                    "04/10/2022",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  )),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(
                            5.0) //                 <--- border radius here
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
                  "Active Task:",
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
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          "Research and Development",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Container(
                        width: 180,
                        child: Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: 38,
                              width: 50,
                              child: Center(
                                  child: Text(
                                "Stop",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              )),
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(
                                        5.0) //                 <--- border radius here
                                    ),
                              ),
                            ),
                            Container(
                              height: 38,
                              width: 90,
                              child: Center(
                                  child: Text(
                                "Complete",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              )),
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(
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


