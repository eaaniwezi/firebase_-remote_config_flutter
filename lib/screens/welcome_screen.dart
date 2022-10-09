// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sport_news_app/bloc/remote_config/remote_config_bloc.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final router = AutoRouter.of(context);
    return BlocConsumer<RemoteConfigBloc, RemoteConfigState>(
      listener: (context, state) {
        if (state is EmptyPathState) {
          router.pushNamed("/news");
        }
        if (state is SuccessLoadingConfig) {
          router.pushNamed("/web-view");
        }
      },
      builder: (context, state) {
        return Scaffold(
            body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text("Welcome\n", style: TextStyle(fontSize: 20))),
            CircularProgressIndicator()
          ],
        ));
      },
    );
  }
}
