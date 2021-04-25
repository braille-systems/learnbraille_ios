import 'package:braille_abc/components/expansion_tile.dart';
import 'package:flutter/cupertino.dart';

@immutable
class SectionModel {
  final String name;
  final IconData icon;
  final Widget expandedList;
  final GlobalKey<UserExpansionTileState> expansionTile = GlobalKey();

  SectionModel({this.name, this.icon, this.expandedList});
}
