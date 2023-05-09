import 'package:bloc_mvvm_poc_app/models/user_models.dart';
import 'package:bloc_mvvm_poc_app/router/app_route_constant.dart';
import 'package:bloc_mvvm_poc_app/ui/myhome_page.dart';
import 'package:bloc_mvvm_poc_app/ui/fourth_screen.dart';
import 'package:bloc_mvvm_poc_app/ui/third_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Contains all of the app routes configurations
class AppRouter {
  GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: MyAppRouteConstants.homeRouteName,
        path: '/',
        pageBuilder: (context, state) {
          return const MaterialPage(child: MyHomePage());
        },
      ),
      GoRoute(
        name: MyAppRouteConstants.thirdRouteName,
        path: '/third/:username/:userid',
        pageBuilder: (context, state) {
          return MaterialPage(
              child: ThirdScreen(
            //userid: state.pathParameters['userid']!,
            userid: state.pathParameters['userid'],
            username: state.pathParameters['username']!,
          ));
        },
      ),
      GoRoute(
        name: MyAppRouteConstants.fourthRouteName,
        path: '/fourth',
        pageBuilder: (context, state) {
          Support sample = state.extra as Support;
          return MaterialPage(
              child: FourthScreen(
            object: sample,
          ));
        },
      ),
    ],
  );
}
