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
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      content: Text(
        content,
        style: TextStyle(
            color: Colors.black,
            fontSize: Sizes.dp14(context)),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text(
            cancelText,
            style: TextStyle(
                color: Colors.red,
                fontSize: Sizes.dp14(context)),
          ),
          onPressed: onTapCancel,
        ),
        FlatButton(
          child: Text(
            acceptText,
            style: TextStyle(
                color: Colors.red,
                fontSize: Sizes.dp14(context)),
          ),
          onPressed: onTapAccept,
        ),
      ],
    );
  }
}