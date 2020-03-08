import 'package:flutter/material.dart';
import 'package:kawalcovid19/common/sizes.dart';

class CardImportantLink extends StatelessWidget {

  final String title;
  final Function onTap;

  const CardImportantLink({Key key, this.title, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Sizes.dp4(context), bottom: Sizes.dp4(context)),
      child: Container(
        child: InkWell(
          onTap: onTap,
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Sizes.dp6(context))),
            elevation: 3.0,
            child: Container(
              padding: EdgeInsets.all(Sizes.dp16(context)),
              width: Sizes.width(context),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: Sizes.dp20(context),
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
