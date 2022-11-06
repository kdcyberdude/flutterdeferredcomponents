import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void callToast(String mesg) {
  Fluttertoast.showToast(
      msg: mesg,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
      fontSize: 14.0);
}