import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Navigation {

  static intent(BuildContext context, String nameRouted) {
    Navigator.pushNamed(context, nameRouted);
  }

  static intentWithData(BuildContext context, String nameRouted, Object argumentClass) {
    Navigator.pushNamed(
      context,
      nameRouted,
      arguments: argumentClass
    );
  }

  static launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

}