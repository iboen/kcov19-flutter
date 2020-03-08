import 'package:flutter/material.dart';
import 'package:kawalcovid19/common/sizes.dart';

class PopUp extends StatelessWidget {

  final String content, cancelText, acceptText;
  final GestureTapCallback onTapAccept, onTapCancel;

  const PopUp({Key key, @required this.onTapCancel, this.content, this.cancelText, this.acceptText, @required this.onTapAccept}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(Sizes.dp10(context))),
      ),
      content: Text(
        content,
      ),
      actions: <Widget>[
        FlatButton(
          child: Text(
            cancelText,
          ),
          onPressed: onTapCancel,
        ),
        FlatButton(
          child: Text(
            acceptText,
          ),
          onPressed: onTapAccept,
        ),
      ],
    );
  }
}