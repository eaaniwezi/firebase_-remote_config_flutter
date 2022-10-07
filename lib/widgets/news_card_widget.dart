// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_sport_news_app/models/news.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';

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
                              // "https://assets.goal.com/v3/assets/bltcc7a7ffd2fbf71f5/blt6bd0c53c6463d226/628787c982d8390ac48675f9/GettyImages-1392411619.jpg?quality=80&format=pjpg&auto=webp&width=1000",
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
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () async {
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
                        child: Text(
                          newsModel.name.toString().toUpperCase(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.purple),
                        ),
                      ),
                      SizedBox(height: 10),
                      Expanded(
                        child: Text(
                          newsModel.description.toString(),
                          textAlign: TextAlign.justify,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 5,
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
    );
  }
}
