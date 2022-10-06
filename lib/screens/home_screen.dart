// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_sport_news_app/models/news.dart';
import 'package:flutter_sport_news_app/widgets/news_card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Sport-News"),
      ),
      body: ListView.builder(
          itemCount: newsList.length,
          itemBuilder: (context, index) {
            var newsModel = newsList[index];
            return NewsCardWidget(newsModel: newsModel);
          }),
    );
  }
}
