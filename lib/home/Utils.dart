import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'User.dart';

class Utils{
  static List<User> usersUtils = List();

  static showToast(String message){
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}