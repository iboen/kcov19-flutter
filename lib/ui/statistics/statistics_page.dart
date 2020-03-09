import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kawalcovid19/blocs/statistics/bloc.dart';
import 'package:kawalcovid19/common/sizes.dart';
import 'package:kawalcovid19/widget/card/card_statistics.dart';

class StatisticsPage extends StatefulWidget {
  @override
  _StatisticsPageState createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<StatisticsBloc>(context).add(LoadStatistics());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          BlocBuilder<StatisticsBloc, StatisticsState>(
            builder: (context, state) {
              if (state is StatisticsLoaded) {
                return CardStatistics(
                  confirmed: state.statistics.confirmed.value,
                  recovered: state.statistics.recovered.value,
                  deaths: state.statistics.deaths.value,
                  lastUpdatedAt: state.statistics.metadata.lastUpdatedAt,
                );
              } else if (state is StatisticsLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is StatisticsNotLoaded) {
                return Center(child: Text(state.errorMessage));
              } else {
                return Center(child: Text(""));
              }
            },
          ),
          SizedBox(
            height: Sizes.dp25(context),
          ),
          Text(
            "Detail Kasus Lengkap",
            style: TextStyle(
              fontSize: Sizes.dp20(context),
              fontWeight: FontWeight.w800,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: Sizes.dp25(context),
          ),
        ],
      ),
    );
  }

}
