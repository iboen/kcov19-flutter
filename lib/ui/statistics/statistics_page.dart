import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kawalcovid19/blocs/confirmed/bloc.dart';
import 'package:kawalcovid19/blocs/statistics/bloc.dart';
import 'package:kawalcovid19/common/sizes.dart';
import 'package:kawalcovid19/network/rest_client.dart';
import 'package:kawalcovid19/widget/card/card_detail_statistics.dart';
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
    BlocProvider.of<ConfirmedBloc>(context).add(LoadConfirmed());
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate([
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
          ]),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Detail Kasus Lengkap",
                style: TextStyle(
                  fontSize: Sizes.dp20(context),
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(
              height: Sizes.dp8(context),
            ),
            BlocBuilder<ConfirmedBloc, ConfirmedState>(
              builder: (context, state) {
                if (state is ConfirmedLoaded) {
                  return ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount:
                        state.confirmed == null ? 0 : state.confirmed.length,
                    itemBuilder: (BuildContext context, int index) {
                      ListConfirmed listConfirmed = state.confirmed[index];
                      return CardDetailStatistics(
                        caseId: listConfirmed.caseId,
                        age: listConfirmed.age,
                        gender: listConfirmed.gender,
                        city: listConfirmed.city,
                        province: listConfirmed.province,
                        hospitalizedIn: listConfirmed.hospitalizedIn,
                        notes: listConfirmed.notes,
                      );
                    },
                  );
                } else if (state is ConfirmedLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is ConfirmedNotLoaded) {
                  return Center(child: Text(state.errorMessage));
                } else {
                  return Center(child: Text(""));
                }
              },
            ),
          ]),
        ),
      ],
    );
  }
}
