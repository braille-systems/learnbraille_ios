import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@immutable
class SectionModel {
  final String name;
  final IconData icon;
  final Widget expandedList;

  SectionModel({this.name, this.icon, this.expandedList});
}
