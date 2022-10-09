// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../models/news.dart' as _i7;
import '../screens/news_detail_screen.dart' as _i4;
import '../screens/news_screen.dart' as _i1;
import '../screens/webview_screen.dart' as _i3;
import '../screens/welcome_screen.dart' as _i2;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    NewsScreenRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.NewsScreen());
    },
    WelcomeScreenRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.WelcomeScreen());
    },
    WebViewScreenRoute.name: (routeData) {
      final args = routeData.argsAs<WebViewScreenRouteArgs>();
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i3.WebViewScreen(key: args.key, url: args.url));
    },
    NewsDetailScreenRoute.name: (routeData) {
      final args = routeData.argsAs<NewsDetailScreenRouteArgs>();
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              _i4.NewsDetailScreen(key: args.key, newsModel: args.newsModel));
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(NewsScreenRoute.name, path: '/news'),
        _i5.RouteConfig(WelcomeScreenRoute.name, path: '/'),
        _i5.RouteConfig(WebViewScreenRoute.name, path: '/web-view'),
        _i5.RouteConfig(NewsDetailScreenRoute.name, path: '/news-detail')
      ];
}

/// generated route for
/// [_i1.NewsScreen]
class NewsScreenRoute extends _i5.PageRouteInfo<void> {
  const NewsScreenRoute() : super(NewsScreenRoute.name, path: '/news');

  static const String name = 'NewsScreenRoute';
}

/// generated route for
/// [_i2.WelcomeScreen]
class WelcomeScreenRoute extends _i5.PageRouteInfo<void> {
  const WelcomeScreenRoute() : super(WelcomeScreenRoute.name, path: '/');

  static const String name = 'WelcomeScreenRoute';
}

/// generated route for
/// [_i3.WebViewScreen]
class WebViewScreenRoute extends _i5.PageRouteInfo<WebViewScreenRouteArgs> {
  WebViewScreenRoute({_i6.Key? key, required String url})
      : super(WebViewScreenRoute.name,
            path: '/web-view',
            args: WebViewScreenRouteArgs(key: key, url: url));

  static const String name = 'WebViewScreenRoute';
}

class WebViewScreenRouteArgs {
  const WebViewScreenRouteArgs({this.key, required this.url});

  final _i6.Key? key;

  final String url;

  @override
  String toString() {
    return 'WebViewScreenRouteArgs{key: $key, url: $url}';
  }
}

/// generated route for
/// [_i4.NewsDetailScreen]
class NewsDetailScreenRoute
    extends _i5.PageRouteInfo<NewsDetailScreenRouteArgs> {
  NewsDetailScreenRoute({_i6.Key? key, required _i7.News newsModel})
      : super(NewsDetailScreenRoute.name,
            path: '/news-detail',
            args: NewsDetailScreenRouteArgs(key: key, newsModel: newsModel));

  static const String name = 'NewsDetailScreenRoute';
}

class NewsDetailScreenRouteArgs {
  const NewsDetailScreenRouteArgs({this.key, required this.newsModel});

  final _i6.Key? key;

  final _i7.News newsModel;

  @override
  String toString() {
    return 'NewsDetailScreenRouteArgs{key: $key, newsModel: $newsModel}';
  }
}
