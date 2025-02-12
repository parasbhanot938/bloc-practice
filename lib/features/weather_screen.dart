import 'dart:convert';

import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  var jsonString = jsonDecode('''
      {
    "status": "ok",
    "totalResults": "6695",
    "articles": [
      {
        "source": {"id": "3", "name": "GlobeNewswire"},
        "author": "Digital Science",
        "title":
            "Digital Science announces IFI CLAIMS annual rankings: Samsung leads again in U.S. patents while Qualcomm leaps into second place; overall grants dip 3.4%",
        "description":
            "New 2023 patent data rankings highlight escalating areas of R&D activity, according to an annual patent study by Digital Science company IFI CLAIMS.......",
        "url":
            "https://www.globenewswire.com/news release/2024/01/09/2806018/0/en/Digital Science announces IFI CLAIMS annual rankings Samsung leads again in U S patents while Qualcomm leaps into second place overall grants dip 3 4.html",
        "urlToImage":
            "https://ml eu.globenewswire.com/Resource/Download/826de7f9 787e 4973 84a2 1366ad60e36d",
        "publishedAt": "2024 01 09T09:00:00Z",
        "content":
            "NEW HAVEN, Conn., Jan. 09, 2024 (GLOBE NEWSWIRE)    U.S. patent grants declined 3.4% from 2022, the lowest level since 2019, and Samsung held onto the top spot for the second year in a row according … [+7300 chars]"
      }
    ]
  }
  ''');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return ListTile(
              // leading: Text(jsonString['articles']['source']['id'].toString()),
              title: Text(jsonString['articles'][index]['title'].toString()),
              onTap: () {},
              subtitle:
                  Text(jsonString['articles'][index]['description'].toString()),
              trailing:
                  Text(jsonString['articles'][index]['author'].toString()),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 20,
            );
          },
          itemCount: jsonString['articles'].length),
    );
  }
}
