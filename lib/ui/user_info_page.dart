import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import '../models/single_user_model.dart';
import '../repository/auth_repository.dart';

class UserInfoPage extends StatefulWidget {
  const UserInfoPage({super.key, required this.id});
  final int id;

  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  SingleUserModel? userModel;
  @override
  void initState() {
    super.initState();
    getSingleUserData();
  }

  Future<void> getSingleUserData() async {
    var authRepo = AuthRepository();
    userModel = await authRepo.getSingleUserData(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
                child: CircleAvatar(
              radius: 50,
              backgroundImage:
                  ExtendedNetworkImageProvider(userModel?.avatar ?? ""),
            ))
          ],
        ),
      ),
    );
  }
}
