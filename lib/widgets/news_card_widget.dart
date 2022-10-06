// ignore_for_file: prefer_const_constructors

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_sport_news_app/models/news.dart';

class NewsCardWidget extends StatelessWidget {
  final News newsModel;
  const NewsCardWidget({ Key? key , required this.newsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          width: 5,
                          color: Colors.primaries[
                              Random().nextInt(Colors.primaries.length)])),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          newsModel.name.toString().toUpperCase(),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 25),
                        Text(
                          newsModel.description.toString(),
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
  }
}