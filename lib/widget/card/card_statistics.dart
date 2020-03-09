import 'package:flutter/material.dart';
import 'package:kawalcovid19/common/color_palettes.dart';
import 'package:kawalcovid19/common/sizes.dart';

class CardStatistics extends StatelessWidget {

  final int confirmed, recovered, deaths;
  final String lastUpdatedAt;

  const CardStatistics({Key key, this.confirmed, this.recovered, this.deaths, this.lastUpdatedAt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Sizes.dp6(context))),
            elevation: 3.0,
            child: Container(
              padding: EdgeInsets.all(Sizes.dp16(context)),
              width: Sizes.width(context),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Text(
                      confirmed.toString(),
                      style: TextStyle(
                        fontSize: Sizes.width(context) / 5,
                        fontWeight: FontWeight.w800,
                        color: ColorPalettes.orange,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "Terkonfimasi",
                    ),
                  ],
                )
              ),
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Sizes.dp6(context))),
            elevation: 3.0,
            child: Container(
              padding: EdgeInsets.all(Sizes.dp16(context)),
              width: Sizes.width(context),
              child: Center(
                  child: Column(
                    children: <Widget>[
                      Text(
                        recovered.toString(),
                        style: TextStyle(
                          fontSize: Sizes.width(context) / 5,
                          fontWeight: FontWeight.w800,
                          color: ColorPalettes.green,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        "Sembuh",
                      ),
                    ],
                  )
              ),
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Sizes.dp6(context))),
            elevation: 3.0,
            child: Container(
              padding: EdgeInsets.all(Sizes.dp16(context)),
              width: Sizes.width(context),
              child: Center(
                  child: Column(
                    children: <Widget>[
                      Text(
                        deaths.toString(),
                        style: TextStyle(
                          fontSize: Sizes.width(context) / 5,
                          fontWeight: FontWeight.w800,
                          color: ColorPalettes.badgeColor,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        "Meninggal",
                      ),
                    ],
                  )
              ),
            ),
          ),
          SizedBox(
            height: Sizes.dp12(context),
          ),
          Text(
            "Pembaharuan Terakhir: $lastUpdatedAt",
          ),
        ],
      )
    );
  }
}
