// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sport_news_app/services/remote_config_service.dart';
import 'injection_container.dart' as di;
import 'package:flutter_sport_news_app/routes/app_router.gr.dart';
import 'package:flutter_sport_news_app/routes/route_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();
  // final remoteConfigService = RemoteConfigService();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final appRouter = AppRouter();
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Sport-News',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      routerDelegate: appRouter.delegate(
        navigatorObservers: () => [MyObserver()],
      ),
      routeInformationParser: appRouter.defaultRouteParser(),
    );
  }
}
