//Prompt users to update app if there is a new version available

import 'dart:io';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kawalcovid19/const/app_constant.dart';
import 'package:launch_review/launch_review.dart';
import 'package:package_info/package_info.dart';

versionCheck(context) async {
  //Get Current installed version of app
  final PackageInfo info = await PackageInfo.fromPlatform();
  double currentVersion = double.parse(info.version.trim().replaceAll(".", ""));

  //Get Latest version info from firebase config
  final RemoteConfig remoteConfig = await RemoteConfig.instance;

  try {
    // Using default duration to force fetching from remote server.
    await remoteConfig.fetch(expiration: const Duration(seconds: 0));
    await remoteConfig.activateFetched();
    remoteConfig.getString(AppConstant.RC_LATEST_VERSION);
    double newVersion = double.parse(remoteConfig
        .getString(AppConstant.RC_LATEST_VERSION)
        .trim()
        .replaceAll(".", ""));
    if (newVersion > currentVersion) {
      _showVersionDialog(context, info);
    }
  } on FetchThrottledException catch (exception) {
    // Fetch throttled.
    print(exception);
  } catch (exception) {
    print('Unable to fetch remote config. Cached or default values will be '
        'used');
  }
}

//Show Dialog to force user to update
_showVersionDialog(context, PackageInfo info) async {
  await showDialog<String>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      String title = "New Update Available";
      String message =
          "There is a newer version of app available please update it now.";
      String btnLabel = "Update Now";
      String btnLabelCancel = "Later";
      return Platform.isIOS
          ? new CupertinoAlertDialog(
              title: Text(title),
              content: Text(message),
              actions: <Widget>[
                FlatButton(
                  child: Text(btnLabel),
                  // TODO appId
                  onPressed: () => LaunchReview.launch(iOSAppId: "123"),
                ),
                FlatButton(
                  child: Text(btnLabelCancel),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            )
          : new AlertDialog(
              title: Text(title),
              content: Text(message),
              actions: <Widget>[
                FlatButton(
                  child: Text(btnLabelCancel),
                  onPressed: () => Navigator.pop(context),
                ),
                FlatButton(
                  child: Text(btnLabel),
                  onPressed: () =>
                      LaunchReview.launch(androidAppId: info.packageName),
                ),
              ],
            );
    },
  );
}
