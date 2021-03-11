import 'dart:collection';

import 'package:braille_abc/components/expandable_list_widget.dart';


class Section {
   String name;
   String description;
   dynamic sectionHelp;

  Section(this.name, this.description, this.sectionHelp);
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

class Contact {
  String name, email;
  int age;
  Contact(this.name, this.email, this.age);
}

class NeContact extends Contact{
  String name, email;
  int age;

  NeContact(String name, String email, int age) : super(name, email, age);
}