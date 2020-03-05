import 'package:flutter/material.dart';
import 'package:kawalcovid19/widget/card/card_article.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0,0,10.0,0),
        child: ListView.builder(
          primary: false,
          shrinkWrap: true,
          itemCount: restaurants == null ? 0 :restaurants.length,
          itemBuilder: (BuildContext context, int index) {
            Map restaurant = restaurants[index];
            return CardArticle(
              img: restaurant["img"],
              title: restaurant["title"],
              shortContent: restaurant["shortContent"],
              date: restaurant["date"],
            );
          },
        ),
      ),
    );
  }
}

// temporary data dummy
List restaurants = [
  {
    "img": "https://awsimages.detik.net.id/api/wm/2020/03/05/71372c6f-3dc5-485b-bb78-823bd6b36363_169.jpeg?wid=54&w=650&v=1&t=jpeg",
    "title": "Title",
    "shortContent": "Short Content",
    "date": "2020-03-05T14:10:56Z"
  },
  {
    "img": "https://www.harianhaluan.com/assets/berita/original/24259554315-aster.jpeg",
    "title": "Title",
    "shortContent": "Shor Content",
    "date": "2020-03-05T13:34:10Z"
  },
  {
    "img": "https://www.tagar.id/Asset/uploads2019/1583412876587-kantor-grab-yogyakarta.jpg",
    "title": "Title",
    "shortContent": "Short Content",
    "date": "2020-03-05T13:03:00Z"
  },
  {
    "img": "https://awsimages.detik.net.id/api/wm/2019/12/22/4a896468-2cd4-40c6-a1bf-249b6616ea2f_169.jpeg?wid=54&w=650&v=1&t=jpeg",
    "title": "Title",
    "shortContent": "Short Content",
    "date": "2020-03-05T12:52:54Z"
  },
  {
    "img": "https://asset.kompas.com/crops/0gRMCxFjfGlRyKq5vN9wOnvr9w0=/0x41:1000x708/780x390/filters:watermark(data/photo/2020/03/05/5e605747d66ad.png,0,-0,1)/data/photo/2020/03/01/5e5b66c42d2f1.jpg",
    "title": "Title",
    "shortContent": "Short Content",
    "date": "2020-03-05T12:51:00Z"
  },
];