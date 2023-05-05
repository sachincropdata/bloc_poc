import 'package:bloc_mvvm_poc_app/bloc/main_bloc.dart';
import 'package:bloc_mvvm_poc_app/models/user_models.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MainBloc? _bloc = MainBloc();

  @override
  void initState() {
    // TODO: implement initState
    // BlocProvider.of<MainBloc>(context).add(GetUserList());

    super.initState();

    _bloc?.add(GetUserList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc POC'),
      ),
      body: _bodyWidget(),
    );
  }

  Widget _bodyWidget() {
    return BlocConsumer<MainBloc, MainState>(
      bloc: _bloc,
      listener: (context, state) {
        Fluttertoast.showToast(
            msg: 'Click on view more button',
            backgroundColor: Colors.black,
            textColor: Colors.white,
            toastLength: Toast.LENGTH_LONG);
      },
      builder: (context, state) {
        if (state is LodedingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is LodedingFailedState) {
          return const Center(child: Text("Error"));
        }
        if (state is LodededState) {
          List<Data> userList = state.data;
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: userList.length,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 8),
                        child: Card(
                            color: Theme.of(context).primaryColor,
                            child: ListTile(
                                title: Text(
                                  '${userList[index].firstName}  ${userList[index].lastName}',
                                  style: const TextStyle(color: Colors.white),
                                ),
                                subtitle: Text(
                                  '${userList[index].email}',
                                  style: const TextStyle(color: Colors.white),
                                ),
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      userList[index].avatar.toString()),
                                ))),
                      );
                    }),
              ),
              Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        _bloc?.add(ViewMoreButtonEvent());
                      },
                      child: Text('View More')))
            ],
          );
        }
        return Container();
      },
    );
  }
}
