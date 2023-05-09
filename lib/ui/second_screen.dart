import 'package:bloc_mvvm_poc_app/models/user_models.dart';
import 'package:bloc_mvvm_poc_app/router/app_route_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecoState();
}

class _SecoState extends State<SecondScreen> {
  Support? udata;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    udata = Support('Data Url', 'Data msg');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
              onPressed: (() {
                GoRouter.of(context).goNamed(MyAppRouteConstants.thirdRouteName,
                    pathParameters: {'userid': "2", "username": "Sachin"});
              }),
              child: Text('Send values')),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
              onPressed: (() {
                GoRouter.of(context)
                    .goNamed(MyAppRouteConstants.fourthRouteName, extra: udata);
              }),
              child: Text('Send Object')),
        ),
      ],
    );
  }
}
