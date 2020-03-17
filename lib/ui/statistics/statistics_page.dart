import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kawalcovid19/blocs/statistics/bloc.dart';
import 'package:kawalcovid19/common/navigation.dart';
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
//    BlocProvider.of<ConfirmedBloc>(context).add(LoadConfirmed());
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text("Jumlah Kasus di Indonesia Saat Ini",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
            SizedBox(
              height: 16,
            ),
            BlocBuilder<StatisticsBloc, StatisticsState>(
              builder: (context, state) {
                if (state is StatisticsLoaded) {
                  return Column(
                    children: <Widget>[
                      CardStatistics(
                        confirmed: state.statistics.confirmed.value,
                        activeCare: state.statistics.activeCare.value,
                        recovered: state.statistics.recovered.value,
                        deaths: state.statistics.deaths.value,
                        lastUpdatedAt: state.statistics.metadata.lastUpdatedAt,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      OutlineButton(
                        child: Text("Daftar Kasus Lengkap »"),
                        onPressed: () {
                          Navigation.launchURL("https://kcov.id/daftarpositif");
                        },
                      )
                    ],
                  );
                } else if (state is StatisticsLoading) {
                  return Padding(
                    padding: EdgeInsets.all(Sizes.dp16(context)),
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else if (state is StatisticsNotLoaded) {
                  return Padding(
                    padding: EdgeInsets.all(Sizes.dp16(context)),
                    child: Center(child: Text(state.errorMessage)),
                  );
                } else {
                  return Center(child: Text(""));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
