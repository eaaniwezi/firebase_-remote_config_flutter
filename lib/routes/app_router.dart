import 'package:auto_route/auto_route.dart';
import 'package:flutter_sport_news_app/screens/news_screen.dart';
import 'package:flutter_sport_news_app/screens/news_detail_screen.dart';
import 'package:flutter_sport_news_app/screens/webview_screen.dart';
import 'package:flutter_sport_news_app/screens/welcome_screen.dart';


@MaterialAutoRouter(routes: [
  AutoRoute(page: NewsScreen, path: '/news'),
  AutoRoute(page: WelcomeScreen, initial: true),
  AutoRoute(page: WebViewScreen, path: '/web-view'),
  AutoRoute(page: NewsDetailScreen, path: '/news-detail'),
])
class $AppRouter {}