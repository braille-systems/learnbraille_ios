import 'package:braille_abc/models/app_names.dart';
import 'package:braille_abc/models/app_icons.dart';
import 'package:flutter/cupertino.dart';

@immutable
class PracticeButton {
  final SectionType sectionType;
  final AppIcons icon;

  const PracticeButton({this.sectionType, this.icon});
}