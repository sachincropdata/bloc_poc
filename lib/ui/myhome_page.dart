import 'package:bloc_mvvm_poc_app/bloc/main_bloc.dart';
import 'package:bloc_mvvm_poc_app/ui/user_info_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    MainBloc bloc = MainBloc();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc POC'),
      ),
      body: BodyWidget(bloc: bloc),
    );
  }
}

class BodyWidget extends StatelessWidget {
  const BodyWidget({super.key, this.bloc});
  final MainBloc? bloc;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainBloc, MainState>(
      bloc: bloc?..add(GetUserListEvent()),
      listener: (context, state) {
        if (state is LoadingState) {
          Fluttertoast.showToast(
            msg: 'Click on view more button',
            backgroundColor: Colors.black,
            textColor: Colors.white,
            toastLength: Toast.LENGTH_LONG,
          );
        }
        if (state is LoadedState && state.noMoreData) {
          Fluttertoast.showToast(
            msg: "No more data",
            backgroundColor: Colors.black,
            textColor: Colors.white,
            toastLength: Toast.LENGTH_LONG,
          );
        }
      },
      builder: (context, state) {
        if (state is LoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is LoadingFailedState) {
          return const Center(child: Text("Error"));
        }

        if (state is LoadedState) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: bloc?.userList.length,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 8,
                        ),
                        child: Card(
                            color: Theme.of(context).primaryColor,
                            child: ListTile(
                                onTap: () => Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => UserInfoPage(
                                            id: bloc?.userList[index].id ?? 1),
                                      ),
                                    ),
                                title: Text(
                                  '${bloc?.userList[index].firstName}  ${bloc?.userList[index].lastName}',
                                  style: const TextStyle(color: Colors.white),
                                ),
                                subtitle: Text(
                                  '${bloc?.userList[index].email}',
                                  style: const TextStyle(color: Colors.white),
                                ),
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    bloc!.userList[index].avatar.toString(),
                                  ),
                                ))),
                      );
                    }),
              ),
              Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    bloc?.add(ViewMoreButtonEvent());
                  },
                  child: const Text('View More'),
                ),
              ),
            ],
          );
        }

        return Container();
      },
    );
  }
}
