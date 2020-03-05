import 'package:flutter/material.dart';

class Navigation {

  static intent(BuildContext context, Widget child) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => child));
  }

}