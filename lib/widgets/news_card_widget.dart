// ignore_for_file: prefer_const_constructors

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_sport_news_app/models/news.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_sport_news_app/screens/news_detail_screen.dart';

class NewsCardWidget extends StatelessWidget {
  final News newsModel;
  const NewsCardWidget({Key? key, required this.newsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => NewsDetailScreen(newsModel: newsModel)));
          },
          child: Container(
            height: MediaQuery.of(context).size.height * 0.2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    width: 5,
                    color: Colors
                        .primaries[Random().nextInt(Colors.primaries.length)])),
            child: Row(
              children: [
                Stack(
                  children: [
                    const Positioned.fill(
                      child: Align(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    SizedBox(
                      //  width: 238,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                        ),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: FadeInImage.memoryNetwork(
                            image: newsModel.picture.toString(),
                            placeholder: kTransparentImage,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          newsModel.name.toString().toUpperCase(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        SizedBox(height: 10),
                        Expanded(
                          child: Text(
                            newsModel.description.toString(),
                            textAlign: TextAlign.justify,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 4,
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
