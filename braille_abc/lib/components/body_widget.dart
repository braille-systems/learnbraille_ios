import 'package:flutter/cupertino.dart';

import 'package:braille_abc/models/app_model.dart';

@immutable
class Body extends StatefulWidget {
  final int index;

  const Body(this.index);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return AppModel.navigationScreens[navigation.values[widget.index]];
  }
}
