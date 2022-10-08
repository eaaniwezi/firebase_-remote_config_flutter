// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';
import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_sport_news_app/models/news.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:flutter_sport_news_app/widgets/news_card_widget.dart';

class NewsDetailScreen extends StatelessWidget {
  final News newsModel;
  const NewsDetailScreen({
    Key? key,
    required this.newsModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _appBar(context),
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                _description(),
                _divider(),
                // Column(
                //     children: newsList
                //         .where((element) => element.id != newsModel.id)
                //         .map((news) => NewsCardWidget(newsModel: news))
                //         .toList())
              ],
            ),
          ),
        ],
      ),
    );
  }

  _divider() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
      child: Divider(color: Colors.black),
    );
  }

  _description() {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          newsModel.description!,
          style: TextStyle(
              fontSize: 17,
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.italic),
        ));
  }

  SliverAppBar _appBar(context) {
    final router = AutoRouter.of(context);
    return SliverAppBar(
      elevation: 0,
      centerTitle: true,
      floating: true,
      pinned: true,
      expandedHeight: MediaQuery.of(context).size.height * 0.2,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(newsModel.picture.toString()),
              ),
            ),
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 35),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Text(
                          newsModel.name.toString().toUpperCase(),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
            )),
      ),
      backgroundColor: Theme.of(context).focusColor,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_rounded,
        ),
        onPressed: () {
          router.pop();
        },
      ),
      title: Text(
        "News details",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
