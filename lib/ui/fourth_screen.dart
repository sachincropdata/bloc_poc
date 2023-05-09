import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/user_models.dart';

class FourthScreen extends StatefulWidget {
  Support? object;
  FourthScreen({super.key, this.object});

  @override
  State<FourthScreen> createState() => _FourthScreenState();
}

class _FourthScreenState extends State<FourthScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var data = widget.object;
    var d = "f";
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
