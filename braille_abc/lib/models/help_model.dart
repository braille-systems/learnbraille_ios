import 'package:braille_abc/components/expandable_list_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:xml/src/xml/nodes/element.dart';

class Section {
   dynamic description;
   dynamic sectionHelp;

  Section(this.description, this.sectionHelp);
}

class HelpModel {
  static Map appHelp;
}

class TextHelpItem {
  List<String> text;
}

class ExpandableHelpItem{
  MyExpandableList expandableHelp;
}