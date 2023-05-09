import 'package:bloc_mvvm_poc_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/connectivity_bloc/connectivity_bloc.dart';
import 'bloc/login_bloc/login_bloc.dart';
import 'config/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<ConnectivityBloc>(
        create: (context) => ConnectivityBloc(),
      ),
      BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(),
      )
    ],
    child: const MyApp(),
  ));
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
      builder: (context, child) =>
          BlocListener<ConnectivityBloc, ConnectivityState>(
        listener: (_, state) {
          if (state is ConnectivityGainedState) {
            ScaffoldMessenger.of(_).showSnackBar(const SnackBar(
              content: Text("Internet is on"),
              backgroundColor: Colors.green,
            ));
            print("ON");
          } else if (state is ConnectivityLostState) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("No Internet"),
              backgroundColor: Colors.red,
            ));
            print("GONE");
          }
        },
        child: child,
      ),
      routerConfig: router,
    );
  }
}
