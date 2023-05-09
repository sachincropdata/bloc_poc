import 'package:bloc_mvvm_poc_app/bloc/main_bloc.dart';
import 'package:bloc_mvvm_poc_app/router/app_router.dart';
import 'package:bloc_mvvm_poc_app/ui/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ui/myhome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final router = AppRouter().router;
    return MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routerConfig: router,
        builder: ((context, child) {
          return BlocProvider(
            create: (context) => MainBloc(),
            child: SecondScreen(),
          );
        }));
  }
}
