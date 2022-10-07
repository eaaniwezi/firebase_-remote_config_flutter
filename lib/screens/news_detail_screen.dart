// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';
import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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
                Column(
                    children: newsList
                        .where((element) => element.id != newsModel.id)
                        .map((news) => NewsCardWidget(newsModel: news))
                        .toList())
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
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: newsModel.description! + "  ",
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic),
            ),
            TextSpan(
              text: "Read More",
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.purple,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic,
                  decoration: TextDecoration.underline),
              recognizer: TapGestureRecognizer()
                ..onTap = () async {
                  if (Platform.isAndroid) {
                    FlutterWebBrowser.openWebPage(
                      url: newsModel.url.toString(),
                    );
                  } else if (Platform.isIOS) {
                    FlutterWebBrowser.openWebPage(
                      url: newsModel.url.toString(),
                    );
                  } else {
                    await FlutterWebBrowser.openWebPage(
                      url: newsModel.url.toString(),
                    );
                  }
                },
            ),
          ],
        ),
      ),
    );
  }

  SliverAppBar _appBar(context) {
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
                // colorFilter: ColorFilter.mode(Theme.of(context).primaryColor.withOpacity(0.7), BlendMode.color),
                image: NetworkImage(newsModel.picture.toString()),
                // fit: BoxFit.fill,
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
          Navigator.pop(context);
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
