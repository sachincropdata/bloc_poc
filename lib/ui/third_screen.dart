import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ThirdScreen extends StatefulWidget {
  String? userid;
  String? username;
  ThirdScreen({super.key, this.userid, this.username});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var u = widget.userid;
    var name = widget.username;
    var cj = "fg";
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
