// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../models/news.dart' as _i5;
import '../screens/home_screen.dart' as _i1;
import '../screens/news_detail_screen.dart' as _i2;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    HomeScreenRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomeScreen());
    },
    NewsDetailScreenRoute.name: (routeData) {
      final args = routeData.argsAs<NewsDetailScreenRouteArgs>();
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              _i2.NewsDetailScreen(key: args.key, newsModel: args.newsModel));
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(HomeScreenRoute.name, path: '/'),
        _i3.RouteConfig(NewsDetailScreenRoute.name, path: '/news-detail')
      ];
}

/// generated route for
/// [_i1.HomeScreen]
class HomeScreenRoute extends _i3.PageRouteInfo<void> {
  const HomeScreenRoute() : super(HomeScreenRoute.name, path: '/');

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [_i2.NewsDetailScreen]
class NewsDetailScreenRoute
    extends _i3.PageRouteInfo<NewsDetailScreenRouteArgs> {
  NewsDetailScreenRoute({_i4.Key? key, required _i5.News newsModel})
      : super(NewsDetailScreenRoute.name,
            path: '/news-detail',
            args: NewsDetailScreenRouteArgs(key: key, newsModel: newsModel));

  static const String name = 'NewsDetailScreenRoute';
}

class NewsDetailScreenRouteArgs {
  const NewsDetailScreenRouteArgs({this.key, required this.newsModel});

  final _i4.Key? key;

  final _i5.News newsModel;

  @override
  String toString() {
    return 'NewsDetailScreenRouteArgs{key: $key, newsModel: $newsModel}';
  }
}
