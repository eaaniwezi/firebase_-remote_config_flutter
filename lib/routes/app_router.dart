import 'package:auto_route/auto_route.dart';
import 'package:flutter_sport_news_app/screens/home_screen.dart';
import 'package:flutter_sport_news_app/screens/news_detail_screen.dart';


@MaterialAutoRouter(routes: [
  AutoRoute(page: HomeScreen, initial: true),
  AutoRoute(page: NewsDetailScreen, path: '/news-detail'),

])
class $AppRouter {}