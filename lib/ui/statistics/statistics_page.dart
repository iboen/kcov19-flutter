import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kawalcovid19/blocs/statistics/bloc.dart';
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
      body: BlocBuilder<StatisticsBloc, StatisticsState>(
        builder: (context, state) {
          if (state is StatisticsLoaded) {
            return ListView(
              children: <Widget>[
                CardStatistics(
                  confirmed: state.statistics.confirmed.value,
                  recovered: state.statistics.recovered.value,
                  deaths: state.statistics.deaths.value,
                  lastUpdatedAt: state.statistics.metadata.lastUpdatedAt,
                ),
              ],
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
    );
  }
}
