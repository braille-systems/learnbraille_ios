import 'package:flutter/cupertino.dart';

@immutable
class SectionModel {
  final String name;
  final IconData icon;
  final Widget expandedList;

  SectionModel({this.name, this.icon, this.expandedList});
}
