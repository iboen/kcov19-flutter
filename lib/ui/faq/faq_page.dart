import 'package:flutter/material.dart';
import 'package:kawalcovid19/common/color_palettes.dart';
import 'package:kawalcovid19/common/image_asset.dart';
import 'package:kawalcovid19/common/sizes.dart';
import 'package:url_launcher/url_launcher.dart';

class FAQPage extends StatelessWidget {

  _launchURL() async {
    const url = 'https://www.who.int/news-room/q-a-detail/q-a-coronaviruses';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: ListView(
          children: <Widget>[
            Container(
              width: Sizes.width(context),
              child: Image.network(
                "https://awsimages.detik.net.id/api/wm/2020/03/05/71372c6f-3dc5-485b-bb78-823bd6b36363_169.jpeg?wid=54&w=650&v=1&t=jpeg",
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: Sizes.dp6(context), bottom: Sizes.dp6(context)),
              child: Container(
                child: Card(
                  elevation: 3.0,
                  child: Padding(
                    padding: EdgeInsets.only(left: Sizes.dp16(context), right: Sizes.dp16(context)),
                    child: Container(
                      width: Sizes.width(context),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Tanya Jawab Seputar COVID-19",
                            style: TextStyle(
                              fontSize: Sizes.dp20(context),
                              fontWeight: FontWeight.w800,
                            ),
                            textAlign: TextAlign.left,
                          ),

                          SizedBox(height: Sizes.dp6(context)),

                          Text(
                            "Yang perlu Anda ketahui seputar COVID-19.",
                            style: TextStyle(
                              fontSize: Sizes.dp12(context),
                              fontWeight: FontWeight.w300,
                            ),
                          ),

                          SizedBox(height: Sizes.dp6(context)),
                          Divider(
                            height: Sizes.dp10(context),
                          ),
                          SizedBox(height: Sizes.dp6(context)),

                          Text(
                            "Penyakitnya",
                            style: TextStyle(
                              fontSize: Sizes.dp18(context),
                              fontWeight: FontWeight.w800,
                            ),
                            textAlign: TextAlign.left,
                          ),

                          SizedBox(height: Sizes.dp6(context)),

                          Text(
                            "Apa itu Virus Korona?",
                            style: TextStyle(
                              fontSize: Sizes.dp16(context),
                              fontWeight: FontWeight.w800,
                            ),
                            textAlign: TextAlign.left,
                          ),

                          SizedBox(height: Sizes.dp6(context)),

                          Container(
                            margin: EdgeInsets.all(Sizes.dp20(context)),
                            width: Sizes.width(context),

                            child: Image.asset(
                              imageFAQ,
                              fit: BoxFit.contain,
                            ),
                          ),

                          SizedBox(height: Sizes.dp6(context)),

                          Text(
                            "Virus korona adalah sebutan untuk jenis virus yang dapat menyebabkan penyakit pada hewan dan manusia. Disebut korona karena bentuknya yang seperti mahkota (korona ~ crown = mahkota dalam bahasa Latin). \n\nBeberapa contoh penyakit pada manusia yang disebabkan oleh virus korona antara lain MERS (Sindrom Pernafasan Timur Tengah) dan SARS (Sindrom Pernafasan Akut Parah). \n\nVirus korona terbaru yang ditemukan yang ditemukan di Wuhan, Tiongkok, pada bulan Desember 2019 diberi nama SARS Coronavirus 2 (SARS-CoV-2) dan menyebabkan penyakit Coronavirus Disease 2019 (COVID-19). \n\nSumber:",
                            style: TextStyle(
                              fontSize: Sizes.dp12(context),
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          InkWell(
                            onTap: _launchURL,
                            child: Text(
                              "https://www.who.int/news-room/q-a-detail/q-a-coronaviruses",
                              style: TextStyle(
                                fontSize: Sizes.dp12(context),
                                fontWeight: FontWeight.w300,
                                decoration: TextDecoration.underline,
                                color: ColorPalettes.lightAccent,
                              ),
                            ),
                          ),

                          SizedBox(height: Sizes.dp6(context)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}