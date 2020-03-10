import 'package:flutter/material.dart';
import 'package:kawalcovid19/common/color_palettes.dart';
import 'package:kawalcovid19/common/sizes.dart';

class CardDetailStatistics extends StatelessWidget {
  final String caseId, gender, city, province, hospitalizedIn, notes;
  final int age;

  const CardDetailStatistics(
      {Key key,
      this.caseId,
      this.age,
      this.gender,
      this.city,
      this.province,
      this.hospitalizedIn,
      this.notes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Sizes.dp8(context), vertical: Sizes.dp4(context)),
      width: Sizes.width(context),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Sizes.dp6(context))),
        elevation: 3.0,
        child: Padding(
          padding: EdgeInsets.all(Sizes.dp10(context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    color: Theme.of(context).primaryTextTheme.body1.color,
                    width: Sizes.width(context) / 6,
                    height: Sizes.width(context) / 6,
                    child: Center(
                      child: Text(
                        caseId == null ? "0" : "#$caseId",
                        style: TextStyle(
                            color: ColorPalettes.orange,
                            fontSize: Sizes.width(context) / 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: Sizes.width(context) / 4,
                      width: Sizes.width(context),
                      padding: EdgeInsets.only(left: Sizes.dp10(context)),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(age == null
                              ? "Umur: Belum diketahui"
                              : "Umur: $age"),
                          Text(gender == null
                              ? "Jenis Kelamin: Belum diketahui"
                              : "Jenis Kelamin: $gender"),
                          Text(city == null
                              ? "Kota: Belum diketahui"
                              : "Kota: $city"),
                          Text(province == null
                              ? "Provinsi: Belum diketahui"
                              : "Provinsi: $province"),
                          Text(hospitalizedIn == null
                              ? "Dirawat di: Belum diketahui"
                              : "Dirawat di: $hospitalizedIn"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Divider(),
              Text(notes == null
                  ? "Notes: Tidak ada keterangan"
                  : "Notes: $notes"),
            ],
          ),
        ),
      ),
    );
  }
}
