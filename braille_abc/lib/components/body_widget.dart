import 'package:braille_abc/models/app_model.dart';
import 'package:flutter/cupertino.dart';

class Body extends StatefulWidget {
  final int index;

  Body(this.index);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return AppModel.screens[widget.index];
  }
}

