import 'package:flutter/material.dart';
import 'package:kawalcovid19/widget/card/card_statistics.dart';

class StatisticsPage extends StatefulWidget {
  @override
  _StatisticsPageState createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          CardStatistics(
            confirmed: "6",
            recovered: "0",
            deaths: "0",
            lastUpdatedAt: "8 Maret 2020",
          ),
        ],
      ),
    );
  }
}
